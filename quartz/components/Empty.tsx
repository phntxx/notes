import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"

export default (() => {
  const Empty: QuartzComponent = ({ cfg, fileData, externalResources }: QuartzComponentProps) => {
    return <></>
  }

  return Empty
}) satisfies QuartzComponentConstructor
