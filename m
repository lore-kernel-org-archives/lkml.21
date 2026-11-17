Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944305;
	b=plKqhmOnSfL5Sxwr2j0zkT0WG306NyZp9L6CTu2YagL2fbSnp5hIIWLecE89J0pz76tY
	 kfeyE6bUHIy3UCmvrze4GCxVoOSu6NNDX5HJyovXHz/cKLIqwk8pzOv9bD0ECIRqCePsv
	 OqsjwF0PsIDT3d7pWM5h33hc5ygW9SZElVA1HILO55o33tdoUl9puR7PrIt2DwsvKycPw
	 bqNwScqBP51s3OHdOcimXj1M0/Jeb0TJA7DIiphW/3lXtZhm4biL4SX0+s7zjN6WGvHEh
	 movSTg2KFtAA0kUx6M0bBezl5AOHeERNUpNAWHDT6GOdu01WoBMR3WxDP1w/1kc1THg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m51bps/KpxA6Kr+kAwjiotkCQAl0xbHrJDx13A2RW/M=;
	b=WP4eLe98rlMhGg19JDCmwkWijuknUrutDSl8Sw2B8WZcumDjQ3LxyGwnHSJTSsCxMww+
	 h9LDn3rCs5qhfCoUI1RhBRWSftqwVX/4dtNxRHHyQP1mXi5UiW3easpWK4i96rqxw49mY
	 BIes1XQwfmEWiS5UTeooSPZqLTMTq5QDmmoBFiLOWTAqkUW+vmCQWPnPX3RDFKvmD85eo
	 6ESevtm2gL+9seiCnQkkf/ZZhJMXBRC5IrgUe2DJujK2FLn69Q4eZztToHgOtiehvgAQw
	 ZYhp+3Lp139hiteAtKJk7a3S9RnIU6L8JP0c/lrqjgcTKPXyh9Glkt3x/w68GLnM33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHM3Q0iX;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652CC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHM3Q0iX
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d68de53053so150849eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944304; x=1795549104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m51bps/KpxA6Kr+kAwjiotkCQAl0xbHrJDx13A2RW/M=;
        b=rHM3Q0iXEosJ6bFTKvCCBc2WXntQuP6hi2AaNTnZ0WMppBfmEupE6xIcCQg8HKB8CT
         uuuOPfF9FixEyQG/X72h4QLOiWUmc5CKX8fMvzLyEqKy+HC8YHtk74g2jnAdsep300h8
         5TqZ0Nu2mQ2NOFgiIgsRq+hAoL8UC/J+C5IAg+dOSyHZnLHi8RG7mD5SJwaqGbrO5FPB
         Y+O3W+40Dr5d6LvdVG8lKMPktYps5Mp+t8Vb5MPr54tOZ+WDQPlzjgE6HY759ByiJtU0
         tcChX/D1054d2u0/3c1aPG0EDGYX7pleNwifdJwZo5ojSFH9mZRe9ttF6DZim75wvMYi
         tBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944304; x=1795549104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m51bps/KpxA6Kr+kAwjiotkCQAl0xbHrJDx13A2RW/M=;
        b=b61D8HxDZHjV0wyNvqwrGM9TSCCT5lPu7WEmUQRO4Rb073Xtm+3svyoVzZO+2aZIaZ
         2lWb1/VbJSyo063nIhy0jATb4BrTYXzhOJp/6SPyZbm3UDzJgRDWbYOfRGLBMUflyv1d
         xG/zqa9/xAYjQeck2Kd4p7MlTTaugKJZvJmJjY4mVVl07isOGiy15v6E3sOkXlE5cUyZ
         kaSl3P5ly3KT0Uu6ZwQGA7Sw7guc8xya0FfeKi8l4zMeEg2+Lyj/pXBhP5p8uTLI3Mjm
         ClYSk6FYkn3bn0HPoWeTqf3Pvr/rH+oHoJtKsV9iyIrQ7ReqOzeFv50u5UBElZoYPFrt
         EP5Q==
X-Forwarded-Encrypted: i=1; AL+hErH1qYuUgza3QWejLNDWw74lgOOOwbq2IHJmh1r36Ac/iMDBtvAlZWhUikXqAb4pmqI0QCsOEKtX9tLQKoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t6m/Te3EJpGH04CA01EeCMgKyA9jZ0y0RnreQJkzTBFrsNet2
	C/+uiiiido4QBdli+TkqUJiLJVxyR3PZhzed+Jr4tvEqDZn9dft2U7xZ
X-Gm-Gg: AYBFou3uLnVfs2KsmLw4adAr/vfcZHqDvZfNgPTIU3cbWyjHGQVbUI0xFKeGtv2x2pt
	1oZo51QRZbq9WMSURNy+7Yz7gjU/eplxUd1Bweup+rWRA/9M/+GyafH7sG5qtM4eEWTpkDvizBS
	tfeMl8pkNy+cEg7M1JG0rSmJBKprKLa4mmGJhsvdoNGV97dmTM3iyrIN8N4clXg0d+ToiWc4xs7
	8NBb77m6VNSkIlMoiFJ0AhV6VQ6TCsyW62o4JdblIp8JrmqQ5MOIEuxPdx1oggh5ygd/8Tme4Nf
	tWW5i+QoxvoPbRtgUDmx31ZSWWQ+GK8+zjjt+JbN4tjHq5hCxYzXrBMgtl6BWnKyICPrhq8Wf1N
	0xVds1wsc4jL0EkuOrg0FoMtjnhJUCPqm5BBBcGIWoZVHBTe5q8qRCrPW5JoiWbiqWXt1DGBAko
	z2ono2psk9Ck4zWeS2H4pbzXta3FWPWDQFAt8tpldIE4shdT3suTHIrpDtYoPwbiQ6Ntpz1ySy4
	YP4+24iIy8JNbLwdB0BbqItYILxvkFY7xD7JcbkbU+cevMQLrb4zrPqzjL3a0V+IuaLrZcJSjsY
	J7DRuCljsYxnHwDqjaiww/e2bz2Ka25x3YuygVuRfF+UozsLcz2l2GBi2pxbx1cUEUym1rlm3wQ
	JztV2dT1K4Cwh7RjHZRENccCiVMgsNcQdeUrkSrI/tsLCdcKFn+hziJi1fouDvd3DzNvqWIHHhG
	4fWk3NpoY5qVGE6JJP4uFKZ/0GMEMqffbIgZvRNz8IM/fCZwTAQLGfs2aNbPBTVWcFTO6CwHNB
X-Received: by 2002:a05:6820:83d1:20b0:71a:f0dc:eca with SMTP id 006d021491bc7-71b18517f47mr215592eaf.40.1794944304317;
        Tue, 17 Nov 2026 11:38:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/11] nvmem: complete provider and layout disconnection
Date: Tue, 17 Nov 2026 12:38:07 -0700
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OQW6DMBBFr4K8zuCYSq3CVaIsMHyTabGh4wEhR
 bl7ndDl0zy9Pw+TIYxs2uphBBtnnlMBd6pMf+/SCOKhsGnOzadz7ovy6iMrpS0i0iLzxgOEJg5
 QjqDNUfCN/xjcpQl9Z0pnEQTe3xvX28El8o1eX+F/Q/C7lnE9NOO7DFIB2uquuuTW2pG1/oEkT
 PUso11Wb3Mf7cRp3e1xeDk2Cye27//qwlWYhRJ2Nbfn8w+LaNKD7wAAAA==
X-Change-ID: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

NVMEM unregister already disconnects register callbacks with SRCU. Some
accesses extend beyond those callbacks: keepout traversal, cell
post-processing, DT fixups and device matching can still use provider
state. Layout unbind also leaves its cells and their callbacks available
to retained consumers.

Extend the existing drain to those accesses, and retire layout-owned
cells independently of provider cells. Old handles retain core-owned
metadata and reject further access. Explicit cell references and sysfs
group ownership make layout removal and rebind independent of existing
consumers. Release the write-protect GPIO when callbacks are drained so
a retained consumer does not prevent provider reprobe.

The final patch lets providers distinguish an explicit NULL module owner
from the parent-driver fallback, for callbacks implemented by built-in
subsystem code.

This separates the NVMEM work previously included in the raw NAND
retained-handle series [0], following Paul's request for smaller patches
[1]. It builds on the NVMEM for-next tree at 6628e7d4c6b, including the
existing SRCU protection and device-reference ownership.

[0] https://lore.kernel.org/r/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com/
[1] https://lore.kernel.org/r/9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (11):
      nvmem: retain the provider node until device release
      nvmem: drain keepout and cell post-processing accesses
      nvmem: exclude disconnected providers from callback admission
      nvmem: release write protection when the provider disconnects
      nvmem: reference cell entries independently of their provider list
      nvmem: manage cell attributes independently of device resources
      nvmem: distinguish layout cells from provider cells
      nvmem: disconnect cells before removing their layout
      nvmem: disconnect published devices before registration rollback
      nvmem: u-boot-env: propagate cell registration errors
      nvmem: allow providers to specify an explicit NULL owner

 drivers/nvmem/core.c                 | 426 ++++++++++++++++++++++++-----------
 drivers/nvmem/internals.h            |   4 +
 drivers/nvmem/layouts.c              |   2 +
 drivers/nvmem/layouts/fixed-layout.c |   2 +-
 drivers/nvmem/layouts/onie-tlv.c     |  19 +-
 drivers/nvmem/layouts/sl28vpd.c      |   2 +-
 drivers/nvmem/layouts/u-boot-env.c   |  25 +-
 include/linux/nvmem-provider.h       |  16 +-
 8 files changed, 352 insertions(+), 144 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
change-id: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

