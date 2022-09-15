from airflow.provider.http.hooks.http import HttpHook


class NewYorkTimesHook:

    def __init__(self, method='GET'):
        self.hook = HttpHook(method=method, http_conn_id='nyt')
        self.conn = self.hook.get_connection(self.hook.http_conn_id)
        self.basic_auth = (self.conn.login, self.conn.password)
