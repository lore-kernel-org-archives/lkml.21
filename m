Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019512;
	b=wpWPgm90dcm33pY+zzkoh2I8c5HVOJdX5x+VExzMSlk0pnDUY599S7bRVwrRzWMqoqTJ
	 9H+OURH6pa69sIzF1an41vwH/Xh0/CjEsZ22Q1wfBSZzwJrfrS6oKcdJFZB1ydBpfgIOP
	 Y48OD1fuPUYWpprKeI9wOglk4o0Sg8JMpK7mHjcKVVzYnn/UTZqrDII6Tv7dhnk4kweOb
	 1/Jf2b4JmZ44QG/i85PMHnYndjj7BdU91wSJTqbxY+PQi14Kho9gv26u69x4jene3JWmH
	 RK3q7STPy4hQ+aWPmuQTnXbYMGoeY4Sc0q3xsqlv7jFZgT2rtEAJV35N5Zqi0cO+g5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019512;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=r+SLzODzG8HHw9cfKRrHw03Y8/zONqIuf6pHGVgPbko=;
	b=Q2fojsgoZdAv6NK2ybqZLgNquOyc4Y0hoAtGvSmAQMPoocPiB8H7ctVsU7/DAuKkOU/M
	 JOeLqiXydAOB+PiSbKGOlWj81EuNmMGxgpt62J8GlhcESxiWpel6IHUtmE22EUEOBJ4vw
	 Fh4MTAPv2Q5Fz9vZzBP5EXy+IrxMfzpdBEHDNnACmV+7v8aoEfpPqoqpZxztovTi+X8Ih
	 ZdWX+nWVE4BXpL1ZWQ5rZG5C3bHg8viIIlGwqMmvF3nYkXhsHjiqjtvj5xf+JkA/wv+FC
	 BNcNvZkYFsy10+Wa45R/vtsdFFZ5FuC3QIOQjI3u5GSwABOifdMRzo+m1rAAXiXMqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wHJw8qKU;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F714606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F714606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wHJw8qKU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38BA7C4F77B;
	Wed, 18 Nov 2026 16:31:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4822E5FE9B;
	Wed, 18 Nov 2026 16:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1090311BC280A;
	Wed, 18 Nov 2026 17:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795019508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r+SLzODzG8HHw9cfKRrHw03Y8/zONqIuf6pHGVgPbko=;
	b=wHJw8qKUoASaCYaUuh6NJ5+MzfzWnvTluXzTcHEQnISrE+l+Gv5JfD83qXKV+5Ho6tmgZe
	Q2dCQLiti0FDkqKPaqSffZtOU01D4iq3QbeRKVPkINy1dDVewKnmtE1YKtO+ZxoYGDAP3/
	mDLU9RbpIWniI5UL8aYszXMoNQMmGDeQ3Nv6ZdcAyBo/6sXZED84TAEOciBPlUW0BnPHu6
	2k17UHPvtn/Jsf+ZOFRtv72BVLqJhTjaMKDXV/u4kL4eB2NMjxzJnwqNmKfesJ55b8Akyx
	8PmePUoMLA27e2mitgRDXYCoh8USLiLvaIlWCKdQbo8+AY22Ehru7jB+USUJPQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:31:43 +0100
Message-Id: <DMYHB3VFX8GQ.2DELCXHWSP8X1@bootlin.com>
Cc: "Francesco Dolcini" <francesco.dolcini@toradex.com>,
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "linux-phy"
 <linux-phy-bounces@lists.infradead.org>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v1] Revert "phy: freescale: fsl-samsung-hdmi: initialize
 default rate"
X-Mailer: aerc 0.22.0
References: <20261116162409.218059-1-francesco@dolcini.it>
In-Reply-To: <20261116162409.218059-1-francesco@dolcini.it>
X-Last-TLS-Session-Version: TLSv1.3

Hi Francesco,

On Mon Nov 16, 2026 at 5:24 PM CET, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> This reverts commit c01ccf91b257741e9edc374a465126bae9ae4711.
>
> Programming the 74.25 MHz configuration at probe fails on i.MX8MP boards,
> the PHY probe aborts and HDMI is no longer available:
>
>   fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
>   fsl-samsung-hdmi-phy 32fdff00.phy: error -ETIMEDOUT: failed to configur=
e default rate
>   fsl-samsung-hdmi-phy 32fdff00.phy: probe with driver fsl-samsung-hdmi-p=
hy failed with error -110
>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/all/13219248.O9o76ZdvQC@steina-w/
> Fixes: c01ccf91b257 ("phy: freescale: fsl-samsung-hdmi: initialize defaul=
t rate")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Got the same issue on i.MX8MP after rebasing on drm-misc-next, which is
based on v7.4-rc2.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
