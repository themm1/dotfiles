local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets('cpp', {
  s('cp', {
    t({
      '#include <bits/stdc++.h>',
      'using namespace std;',
      '',
      'template <class T, class U>',
      'ostream& operator<<(ostream& out, const pair<T, U> &pr) {out << "(" << pr.first << "; " << pr.second << ")";return out;}',
      'template<class T>',
      'ostream& operator<<(ostream& out, const vector<T> &a){out << "[";for(const auto &x : a)out << x << ", ";out << "]";return out;}',
      '',
      '#define dmp(x) cerr << #x << " = " << x << endl',
      '#define dmpn(x) cerr << #x << " = " << x << "; "',
      '',
      '#define int long long',
      'using ll = long long;',
      'using ld = long double;',
      'using pii = pair<int, int>;',
      '#define pb push_back',
      '#define ff first',
      '#define ss second',
      '',
      'void solve() {',
      '    ',
    }),
    i(1, '// code'),
    t({
      '',
      '}',
      '',
      'int32_t main() {',
      '    ios::sync_with_stdio(false);',
      '    cin.tie(0);',
      '    cout.tie(0);',
      '',
      '    int t = 1;',
      '    cin >> t;',
      '    while (t--) {',
      '        solve();',
      '    }',
      '}',
    }),
  }),
})
