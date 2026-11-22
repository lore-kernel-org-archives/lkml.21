Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369120;
	b=jF2iKwR1lDC9kQ17lUUKYa/DbNxkBIUX1YhJCuLhtUDuh5ZNv1ORwHevyyfhlCq5iXhd
	 50eFSbL8jCsGPqPyISeBOnVZwN9jj60ZIY1/dzbz69nnuwH/yrexn5ykccLhQSif7fNNs
	 o029dNqFoHxiKtRrrAkjzVitUMrNl2KhXmdWfuCNk0ebSH6z8ZjT2FT2irRZLSi/y11oJ
	 tk3DkRKdf8s5b5CssGrkSR9eWuOMXQVN9OLg1m2A3MPFVmqzXP0hN4j1wYg5eDq6Obj9X
	 UrjwQTDl5vQjJoyjmhxNP5sXMYRp9nmeSzGlW67odB6WnyxguulRUsgJcjHUuVxNkmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
	b=P6hMpudUBzBb0dHrUfCkJEkzOZ9bB45n3r+jepBmdshnVsx1E/Qs+LOBTeG+/39hLxbV
	 PJHYapdC04GzANkx0//m6cbfuP/cTGwYsHcJHcIld0Aar9HyF6jfjfpZfdwgq+le8qbCi
	 6Uhh68DPQAi3E8RSzludsezmZRgXHIjt/rSgCqK2uK+iD/kyT8kIsA5yCtNHdDygzzwiY
	 P4xCVCFuD3XxuHvJQdr5NXAVhMaOsLY6Iqy+Ne/8masqYYsaTr9Hq9VQ8kTkLOanILmYF
	 ulaa6xmeKwzJy603hPgVDqbR/9dyoinu9lh/h0UbLwTSi72IttKRmoU77KdX7oloCrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTMAQXaT;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67941606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67941606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTMAQXaT
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so3273230eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369119; x=1795973919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=uTMAQXaT040U5qUmYkbdA83OsJ/0S5t9wAC5tjeAWCn0h2wQisMy5QeDH3JXAr4Bit
         VHjz5EbSlUprj4CXB3uxyNJeZsu79WgaX4QM5LzfUHbeGchJXBAwfuXMyh16hVY/Ra4f
         azRRfe+uiZAsccUDkqJw1F8o+f/hhg7t65J+yj1JfY3MXgKdoMqqXLCB6EX0mbQwe+Cb
         WFzQo0cstg5P0ZPRBWg8TLbrTNA7IZpDvS1VR42ZtT7h/a361ukZtSn619G0eMZOjxGv
         21v0Lb56DfgHW4ncixWGXVhE1wkVT8S1fA+g9kzLPK5yli+d2inTNL7OfKTsNzBuGMGF
         cJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369119; x=1795973919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=mNY/u0MNKqFXYAeOqjNJk4TiWbVUArny2RJxK4NAePnF0+1M5Ho10j9ZOFmWg+U90g
         Ak8wrduQHhjgoKk8fOod8NVc1iggAmb3G9aJFQdIUWqAnEkRqPHtRwAf+c90ggOKJJQB
         D0QlfLC5mW6jgz6hnb0AJOl58TbSVIm31yy3zHDrLsW4pQwRstUMRYkBESUYmfA2htNA
         hnPk80TxYIo4JQftvn/4hbWSrMAoi40iPE3RELDwAypmppONuSRc1ESyionoKdVRkpNY
         KDZYTqjUfNu8UUm65/T9BlPoT8sMkZ7RWbZ83kDQRtwcfjpE3Qb2dzeTR/Yr7ixIWZMr
         UViw==
X-Forwarded-Encrypted: i=1; AL+hErFO70dCb3CKKeu9R8I3HlYPXha+uIimKhP/2sFdg4Cx6KmpE4M2IgOSvqy00GE00PXhWTPhoZ4IQLvawLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mLZMkoZKK7N6WywDnIpfmhfZTpMRj9iDQ4wwP0tbssNEGmmlj
	XvBryg9Zqh0l5lMWLd5I1UjoZUyugYXEfWUlx5ib2wUw2SSr+vZkggeD
X-Gm-Gg: AZFdTZcnDY/7m084RiYChbZLzeCzRQry/GIoc9qvUx+B9SQAF5vXc6Tv7nWcT/8DIUt
	7oZAUHT6ihGGqHo1wLnf1eu/TJ6No54+u8y1hq/HDuyuHOaLQfEuQNC66nmNIOt3lTQyv4FoQ3T
	3KcEY6IlTnRNS4CfZepGb3KAyLeRwVmEVoOdlihUSVBx93YnIqXqFDbK8k0iFahSq5CKFDY0p7K
	ItHKDRmhwCm0fNc9Ivv/Vpyp4FOKFIUkagXAFFBApo73iO8VEoYwZe+MKkqRKOO8B6gOeFs7NX4
	cwf5xWpU33m2/tUll0L8auSmhgMpIamnt2go+oSVZhVSaewTOadCU+JAqwaW/J9DLBVgEVdnLF2
	V0muUzSEElJWIDzYDKL9JQL4W4QNsDsYhoapNIHkskRzCVoIvkR1JOQ038SlFDpgNS+rKNaDH2l
	N+PtAPuAf2oz4nLbtHWkjyMqmKRDSQbDLJlIbsiHDVPhYlTyKTIy2fBmfimYJkmqOZpgdtlxXtX
	7sSuHFh6RcENZQWhJGYwpgffW2y+JqIAiEM5vHgH/LSijPoxSa/td2MnSJEwP9flxe7TGi1wfrY
	k3Aqemg1ho6ExWA4e7o8QI1v6Uc6Hsk4uUTy5WDleIg6s5kM/Q==
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr12238447eec.39.1795369119433;
        Sun, 22 Nov 2026 09:38:39 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:38 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:07 +0800
Message-ID: <20261122173810.2409146-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit. Both banks returned the same data
across repeated reads and five unbind/rebind cycles. Reads from the other
banks returned zeros. With the separate K3 thermal series applied, all
seven temperature channels resumed reporting after each rebind.

Changes in v3:
- Use an exclusive, managed reset and assert it on detach or a subsequent
  probe failure.
- Use a 512-byte NVMEM space with bank 0 at 0x000 and bank 7 at 0x0e0;
  cover the other banks with keepouts.
- Update the binding and DT calibration cell offsets to 0x1c and 0xea.
- Clarify the shadow reload names and remove the incorrect reset comment.
- Drop Conor's Acked-by from the binding patch after changing the NVMEM
  address layout.

v2: https://lore.kernel.org/all/20261116075423.1519438-1-duge1256@gmail.com/

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 205 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

