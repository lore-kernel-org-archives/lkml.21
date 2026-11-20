Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174866;
	b=f7+kQsKoO3l5U1NdVvOleXF3tZU/4GXcAIAZII/ZhX80+jlUv3xx6dxjA5Ztb5LVz86p
	 7nADtW8qeUv/HcYrJxMrCMGwLGdpd+VWEHpIsxFcEC0DllVjww/Ruc1U+dEMZ2O1Z3cIQ
	 5zBYRBuTOW086NleI13kPQ8xuasx2qZv87KX2Zwarsig/tTdj/ANxrBbm5y0u9S94oIIX
	 DxCHarDfmMwaNRzCsR53MtgnSbPYemKxV6lUHhsx7D2vAn2AbE+mPiuzZAHZYJZgf1ODu
	 MPbQqyAxEbG9a5O43GAqc98b9/mS/EGCQp5DIvnO8nrB3MN+0Q+V92kiI95EOqN3wrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
	b=pefAd0mbjFoTZWoe5ITklJR60SnG1jCmb8KLj1zFNPEbcduI/1YYg0OcTcRY4MgOKPob
	 HgEiBkzMqkbbG1aDEW+Ij/VZQlNOE8Jg7U+R9pm00RJkGRqfOhUNDShsGDIy3yqHBG/XM
	 tm7PkoRofMhThriG/4E+/Z88OEuR3TLOgxUvLcx4E8FakJJBn8Lt47BayKI7Brh5P5DmX
	 gcr4QLZkVgMxdjxOjgzPFiuR5secG5ur5KwIJOnFtXAFNY3TBnAS7wRSBFpbTxMDLt8WU
	 Tg1GM0R+WU6hRsHJUhN7GQ1OAk5FlGSzLZyMacFnYlxFszcgPRygPKLZorIf5ndkXxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwxCqj8X;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00947606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00947606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwxCqj8X
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8925425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174864; x=1795779664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
        b=JwxCqj8XfU2+uyArh4tcmWO78sFv//GqEEKKhzO9qtOqV0begI692f9O6HjkRUv1Pr
         ++YhlN6hGEd5mN0uCb6XrUh7w/zsvvo4Ts8ohVlqy021lIu6Nlrlw47/j+TBfhs6afo/
         DReqrDYS3SK/Gd03o0MrNrPczZggH8meSTE71V+SMBcEiM4oanTiF/tNQyBFx9volFm6
         e2GMi1rzuBgUaYJbRDWkPxAG2UlSO/PEXnHpaZuA4JrM1RPrDbqZm+J3AiK8w0unh5HN
         /u8FDg7eQ+ffKRXdhle5BBFv1eMbTO5x29pPribFZzqdkh+K7PrZyCP4H92mhSO9UcJr
         lUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174864; x=1795779664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
        b=AMbeqG2b/9/b9K1L4YUP+pu5oAgyMjVCFN2tmDUGf81O8T7zuc3vptTT/t6yzGAYRc
         ZNLPHIEkrXN2rP20QIusRGNCUEB4Lh9Wpofcx7NOovSUFjwmVYnj1XzbfMx0ou8y6riQ
         n6krKsxoIG66NpDyJlUOw4/rLfN+lj9rx/pofOFyuBeSglUhEva22jS+ZtQVGuane6e9
         WOTAn5AFC82HNaDsQv2nxHrYWGa+zd23NSaGudri6xfdc4oIL0pSMvAoC35LDDay/xL5
         iQstDzz0EXr3eIqWFUQfblLaqh5ZDWF+ZyPukudr42tf32n8d3dSrB9rIPZEinHzqR5/
         YWkA==
X-Forwarded-Encrypted: i=1; AL+hErG4AJKWO4RvgXuptkvp2iAgkIAsNJRvX90GIZbtpgaPdfYqR6k2LZm2Q8E2qfAysOEMikL2MJ1k13nH6RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kUBiHXTvZiprp95HWxx3FHrENEFEOngz8AeQ4k6paxATBqIGd
	gToeF/O9hTevK7QsathW7APY+JJz3MvBt0dtIiaFmt4O84b7WFViIWDN
X-Gm-Gg: AYBFou1RhhyoC1Me/i+uDipZ1o0rQOerY+6UoY/Ibw9KMAfSifiwwXtG7uBA//dON2U
	UjHxZt0rfY+yfNgDLTZaKqwMtfEVGJ1Mn8qW0HITlWzTY2aoT8wp1hZknNqnkGX1ca0oodxkTCU
	RlaPrgdOmJgFdmGc3kitPn2ldISmY45fRhobwOxXjus9NMGDDtCek8sAz7rmL0NkqlCxoT9Wg1v
	FwMtUlUBndrmGk74qJpgOKmO/Sm0H5JhwvoS9Ej7lB4f4eTALEq+bqJ/R3awk2g2pxmwYZeDtNE
	zg9hrrANelcIUKpxhaACaWxTSDMXFCq5zo5KV4HuAenhJOQxdNi2q9lQnwVVsuYNPUDdH6bvxJI
	LQkE7Asxza5QGCEm7eoDvMCASyBgjgoFVuRnVkzWpuNIcxwJwaFx4Sm3mo2rD4hdBnh812p4yuW
	z7k7M7dCLL8Qg3XNogha1q7iLCxRRkfO1SoN9sNreCnKX/FFpGDb1PxKu6qya6zkrnQPyJ6mnBt
	9SwTpjaaHQGIDZfScHyaHxynZcgTGRAKGkXvcYuTfxVGRZCycKFHhsuQ4zhtUYJliH/bFp1PdRl
	ZNyswntT0fb5UXM2jDbcohbk6A==
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr62096785e9.1.1795174864114;
        Fri, 20 Nov 2026 03:41:04 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm27419345e9.4.2026.11.20.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:03 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v4 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Fri, 20 Nov 2026 14:40:58 +0300
Message-ID: <20261120114100.978148-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a DRM panel driver and its DT binding for MIPI-DSI
video-mode panels based on the Novatek NT36525 controller, as fitted on
the Samsung Galaxy XCover5 (SM-G525F, Exynos850). The panel is 720x1480,
uses an active-low reset (RESX), and a DCS init sequence that mirrors
the stock Samsung bring-up. Backlight goes through drm_panel_of_backlight().

  Patch 1  dt-bindings (no change since v3)
  Patch 2  the panel driver

v4 addresses Uwe Kleine-König's v3 review comment: drop the unneeded
<linux/mod_devicetable.h> include (it is pulled in transitively; this
driver's of_device_id/MODULE_DEVICE_TABLE(of, ...) still build clean
without it).

Adding phone-devel@vger.kernel.org to Cc per Ivon Argel's suggestion
on the v3 thread, so the relevant ecosystem developers see it (not
adding Ivon's own address; he asked not to be personally Cc'd).

On Michael McAllister's offer to add Moto G10 (DJN NT36525B) support
on top of this series: happy to see a follow-up patch once this base
driver lands; I'll reply on-list separately rather than hold this
series on it.

Tested on a Samsung Galaxy XCover5 running 7.4-rc3 plus this series
(re-confirmed 2026-11-20, kernel 7.4.0-rc3-00023-gdcb8b91fb779+ #32,
after rebasing our local tree from 7.4.0-rc1 to the real 7.4-rc3 tag):
the DSI panel connector probes and reports "connected", debugfs
reports the reset gpio as ACTIVE LOW, and /sys/class/backlight/ is
present and readable. checkpatch.pl and dt_binding_check are clean
(bar the usual new-file MAINTAINERS note; the files are covered by
the DRM PANEL DRIVERS wildcards).

Based on v7.4-rc3.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic). The assistant converted
the vendor init stream to mipi_dsi_dcs_write_seq_multi(), drafted the driver
skeleton and the DT binding, and drafted these changelogs. I reviewed every
line, validated the binding (dt_binding_check, yamllint), tested the driver
on hardware, and take full responsibility for the contribution.
Prompt summary: "convert the XCover5 NT36525 vendor panel init into a
mainline drm_panel driver plus DT binding; keep it checkpatch- and
dt_binding_check-clean; test on the device." Review comments are welcome
and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: display: panel: add Novatek NT36525
  drm/panel: add Novatek NT36525 panel driver

 .../display/panel/novatek,nt36525.yaml        |  83 +++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 490 ++++++++++++++++++
 4 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

--
2.53.0
