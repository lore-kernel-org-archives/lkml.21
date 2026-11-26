Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711274;
	b=RrGp3g1BBjxPwy0PgJLyFPEaZL9nVWbccn6Rx/LFKbjNsRhcxbs0zMAZOLceSjpclqVV
	 se6GuMUxYxNgD1fHgC1SCCO4XitsOgF1OPNjhUY/YVA8W2mlQn4a64eLxX2rblJwn0oSE
	 JT/I0rnkGxNKsCHd4P7X+9MjseDcTZYPAIsS81DzVJ/+5/rsNm08TJB5ko6zmciB8Y1Cz
	 qXTWA+PK4LaCPevgvTH1YzN96xcOQ4Guzhl3sc2bHvI79lM6Ivy8Mi06F7DrFSo4Th6V8
	 piUrowIptSpCxH+StaSDWw8KpJjPAzYFrOuLvQkjGLuUe0gP727QOT+KGjxmOqGfFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
	b=pkzkw/sgYOc0LcfmU5AzOYkUQWW9SdMtTDV17SxNtQZF5k2sMZsZ59gJe5ZXCkfj7q28
	 ZMz1vgLVVsxW56WeH4j8yhyOPBZJw4llQMNZfZgngHH977QOOoerXe+wNOfHHrLA0JpkM
	 CUNeQ0uS9n16IkyxIwD/PmkBnUkvg+znx/lI9E/CEhIEOzmBAYI368V89Pe7TfmJoPT92
	 PWVpbo0azT7L2e+witK5ehAnRddQm9jI/EoTIMUll/xdWLjs7RslLzE+ZKWI12VJqTu7K
	 QSVbRXmfifhaVr5b2OwAro+Z2ABf1JDwyaOyAoHh++3Jvc5XOVhf3vCrtS3znN4WT2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Zf4Rhf;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Zf4Rhf
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4868750f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711272; x=1796316072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=S7Zf4RhfhwbU/5iB1U7hQ/IKD2M96tHFgp2QNQ3AnUaG1/XxMtr5EdHFovP4DSz3jn
         eeF3dlIM4iYvA4Zz0NfrwSH1T550h6Y9f3JjR1mCro+/ekjWFvqVYOPdSfJWD3i5ATS3
         uB0k14jzCvAe9vAq6bOQHnvOSBkfHGSImvtTixddmj8SYeRvK4VLEjxJZDp3Hsw1PJQM
         tiRG9XSaUDomOjnmi+MUotzJ7mBtxN//L+qn1ee3XkuOGC/Awt3oyDo1XtPKxeVjsnBc
         DP0DmN0EJImZu99vHjFQD2JSmRswiS3OSxgRr0wl7g0ixyD///debG0cyYftdhaoIzaY
         IdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711272; x=1796316072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=msp1qSmvnmSJQfNqMkU67RdjNhGjgeNxR5ONbjB1SJc1CJYYlypCs7W3oueLDOK2KQ
         2+4vfdJaCxI0qukv0hTesHFGXQxpQzynT5p9XkG9cqn5FdRQ4pVa61ly1YYMw+TF6BLZ
         ZjOl/+qDgofxBOCTUnN5dZBGLcRSy2HMt5+k1KNr7Uoc+uwyVpScly+0NOAbMF/lDaVo
         gv9LmDHHFuoU9725JkbCqZs1vuPsksT2WwbklU8swRhpNTjiNW+Kn8h9NcGzSk3g0XuU
         IyVl+w+zklZyl8Xlcuaj8OtpYqoIGQyK3SUahM4wDZFHK25mmGqreKDcCxS2r+PPa0wM
         IOLQ==
X-Forwarded-Encrypted: i=1; AL+hErG7panfcmaZWqbYI4POqCAz4yYFehrLCM/3Rl39BiSfjwIymNlzRifhCf7GKu1ROPLZ0dyvr3xTKuoUDgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C0wJqYu77XZuRCONGA5c0K4ZJY07Y4ja7ru+Fgya5IXcAvWQ9
	V62DU5oeRlF7UAZLV8TX0ZqGsaor+FlH+ti961zrvmnds1l+BxLMLRkQ
X-Gm-Gg: AZFdTZfm1RFVdNHyb13OHZV9oQmQ8BAMm+mBiK1CNZruhErpUekJdYShx6TDEQ4LA7r
	AEtEcODR7+x+3Ckc3DUsC5yK17uWqQtffimZiR1jtz69S0+xvmTZwhmndTvaQose9VFSL+J6HFn
	MmmyT3FkLhgQWKPTeIp6BQfeK9uVI1ljxJMuSXUJmfWQ8D6ZB/y6Eh3ZOvA2ACYSEdz1cnSf/s2
	WMIaMCnVem7OVcNmDLQ5fDrK1fKfYJQkqkO2z7zn6hcsXf8ey90XFeIbH0DQRymGBxbyuBi3XMS
	Sz+6PzaNI+joNBfPTM6Fm5to7D3KuBv8WZEmAOkB0Ue0Qgl4Aulz/LW4biYK6wPm9QODz/Z0ZUO
	WPEo/+V9AgsnSxP1a8XQXlzZR8/3KWzrOq5bx46y9Mg+AYiwPnErOvC8sYz5qD25Ad+z3Gsvzez
	6AN1RIjaU1Sgx2S9+QfBIBsKXNAX0ZaOGxllyVQycqZMlJchtEpiRaKlqWvdO1PVWEmOB2o6aY9
	x/i7/yNf8QjIewXTattYcOONkEbtWQu02VD2QZ1IlRi7XoNKLHE26yfSKG5t79FMAbD8fFQwPIJ
	z/SX1BcD+RDhZBqQt85VLyouHqlIQWjfkbU/R4QWzQ82auRm5DN/UQk=
X-Received: by 2002:a05:6000:40e0:b0:4b8:5ccc:eed7 with SMTP id ffacd0b85a97d-4b85cccefccmr15497144f8f.51.1795711271385;
        Thu, 26 Nov 2026 08:41:11 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:10 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>
Subject: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the blk-ctrl virtual devices
Date: Thu, 26 Nov 2026 16:40:57 +0000
Message-ID: <20261126164058.2373605-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

The i.MX8M blk-ctrl drivers drive the GPC domains through the virtual
devices from dev_pm_domain_attach_by_name(). These devices have no
parent and no device link, so their position in dpm_list relative to the
blk-ctrl consumers depends on probe order. When a consumer ends up
before them, the system hangs in the noirq phase.

Patch 1 fixes imx8m-blk-ctrl. It is v1 [2], now also linking the bus
domain virtual device:

- i.MX8MM, VPU: the codecs resume before the virtual devices and the CPU
  hangs in genpd_resume_noirq() of 38310000.video-codec. On Verdin
  iMX8MM this happens on the first suspend to mem.

- i.MX8MP, media: reported by Advait [1], the CPU hangs in
  genpd_resume_noirq() of 32e40000.csi. His debug prints in
  imx8m_blk_ctrl_power_on() show the stall at the first BLK_SFT_RSTN
  read, after pm_runtime_get_sync() on the bus device returned 1.

- i.MX8MP, VPU: a normal boot works only because the Hantro codecs defer
  their probe until the blk-ctrl is bound (the blk-ctrl waits for the
  imx8mp interconnect module), and the deferred retry moves them to the
  end of dpm_list. Loading hantro-vpu after the blk-ctrl has probed
  reproduces the hang on resume.

Patch 2 does the same for imx8mp-blk-ctrl (HSIO and HDMI) and is new in
v2:

- i.MX8MP, HSIO: loading phy-fsl-imx8m-pcie after the blk-ctrl has
  probed puts the PCIe PHY before the virtual devices. On suspend the
  HSIO bus domain is powered off first, and genpd_suspend_noirq() of
  32f00000.pcie-phy never returns. With the module loaded at boot, the
  PHY defers, ends up after the virtual devices, and suspend works.

On Ulf's question in v1 [3]: the GPC domains cannot be genpd parents of
the blk-ctrl domains, because their power-up is interleaved with the
blk-ctrl reset and clocks (see 25e252bcf159), so the blk-ctrl drives
them with runtime PM on the virtual devices. The consumer drivers only
see the blk-ctrl domains. Runtime PM is disabled in the noirq phase, so
->suspend() keeps the virtual devices runtime active, and the runtime PM
calls of the blk-ctrl do not fail in the noirq phase, while the genpd
core powers the GPC domains off and on through the virtual devices. That
requires the virtual devices to be suspended after and resumed before
the consumers, which is what this series adds.

Lucas pointed to v1 as the correct fix in the original report [4].

Tested on top of ulfh/linux-pm fixes:
- Verdin iMX8MM: 20/20 suspend-to-mem cycles. Without the series, the
  first suspend hangs and the watchdog resets the board.
- Verdin iMX8MP, hantro-vpu and phy-fsl-imx8m-pcie loaded after boot:
  20/20 cycles. Without the series, the board hangs.

[1] https://lore.kernel.org/all/CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com/
[2] https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
[3] https://lore.kernel.org/all/CAPDyKFr9Vzgm2C6Z57Bg5mUQxg5LK6goN2og3+RC3BkTZjiqJw@mail.gmail.com/
[4] https://lore.kernel.org/all/8636fb8d9809aaafbd8274ec0dbfc250e1113c73.camel@pengutronix.de/

Vitor Soares (2):
  pmdomain: imx8m-blk-ctrl: fix suspend/resume order
  pmdomain: imx8mp-blk-ctrl: fix suspend/resume order

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 29 ++++++++++++++++++++++++--
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 4 deletions(-)


base-commit: 458777762756acfc7d2c20067cca6cc817cc8dec
-- 
2.53.0

