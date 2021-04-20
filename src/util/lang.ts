export const selectCase = <T>(...cases: Array<[boolean, () => T]>) => {
  const action = cases.find(el => el[0])?.[1]
  if (!action) { throw new Error('SelectCase ends with nothing executed.') }
  return action()
}

export const selectData = <T>(...cases: Array<[boolean, T]>) => {
  const data = cases.find(el => el[0])?.[1]
  if (!data) { throw new Error('SelectCase ends with nothing executed.') }
  return data
}
