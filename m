Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818776;
	b=rNotaqfs205IYjpMIEFHK4cM+k27GcDja2b72/H/9Fx84DlVRKXJPcAlt8AGXibVeRW9
	 LJdCr5CHotyv2nri556gqIw9EXnBdZaAXYxRv1GLqeDnw3AitJYSrVee0lNtMreGuuHMo
	 +lMNk34qnCgHV+iuxCcmz4Xktxrx0wUgzZfRCaFWN92psGkwrM9LDI4Nit1sO3AP48HLd
	 snk/G6PL67RaB9zCsOnqY8L3Wry12P9flZPj1yeOnU6mxZsacQ9Cf4/6NTB4Y3d6+HqzQ
	 oLrLOp25mFeRqJmTYhGGR5iIbDhuyzu2lTrRVTBx3loXkuqhrTqg+7StGYxU/ow3geA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
	b=4fPpgkYpZRNelI5sdGvJO3PSGTX7W7QXI7ZV5g3sVqkb+ruYXel32qMo9qmkoetnU537
	 EM3xSJPtOT9hEZH8MEza1Gq/84qeBTInP199gbSe04M39C+cHUFc/6m5lYq0P/zT9q0mE
	 u7gJim8h6NAa8+k4OsI/0rU+MtqKrSNCM+Y637zfepFa8GHl7nhmr9pfGv/UYdJr207ji
	 R6SMorb56RQLqlaSQ+SRc4P6lZxYada2yOl5HIpP9OQq7+kV2T2rPowG+x7U4xQ7UoHBa
	 hdFWFCdAmkFK7BXN/72OSC+R/MLyi0pqV0wTzR0EUbmvqut3HM2uCdl9fBOPHAqHo5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KXbz5l/u";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A663606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A663606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXbz5l/u
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a9be758734so5385095f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818775; x=1796423575; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
        b=KXbz5l/uODdnOEfSJoNmxfbMA6pMr0YlR66YwD+IB+sEF0i+m+7C+RAxhLyF+SfJbd
         uGJvqUYQRf6EEBoj3BV1n1MD1T2kbbzaipdHnEbFpd97X0el041kD+NYxV8xV2M6Aodz
         KXmHk1p4QZnCdxKPEE0/uDlmFu8NUC6vQDp+XVKM3/TyEnLfD5arLsXTinq019BnJXZ2
         +UoG7nctxn6EsFi2a+RR7zLyC2gVyDadDvkDyC/p3/DjPlgugXiqmKZHV1X1MKvcAZPN
         bcxfO0vexWyZ0j0FpOmMvIm/aNQhTMELCrTP7SxKDl8ixrBZc024O09xabaaEqdrXtyF
         AsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818775; x=1796423575;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e18q7m+XRgO8UtTQ6TkOW3EX1GONk1zjdab/Y9iIkTw=;
        b=HP2y6X87+8MQaMhHE2qCdpp3IsDijjA3M2hMnd8nfQ7GWRjXpP9mJh3KLjPfT556Hs
         9KuskUo2R2cki33dHYKEDSNC6ip/8aZJocs3xbuLovdad0o1PI7I3xnSBf+kwT2YOdrv
         ymHYMHrqgnYTTwD2DH4rqArM6uh36eRUokQWc0PxCi9te14ykU6FyN4MJNBgdweKAqdu
         pNi0riZSJ2otXTBLmXio5DsOeZZWCt7xCYJPNcvmAY468NfrCrD4D9UmhA4OG6h4FUiz
         5qSTMWdv7jIbN7nXFxwOLuwqT+2vh3QNUDrTJyNqnKB/uMYmAnzTe0TaLMKpfaaQssUR
         XnZg==
X-Forwarded-Encrypted: i=1; AL+hErGFkdRZsCq9enfo3ZpXGp5X66uFdcemxG0JGRs/zDi+97kMRqQc/GK5xsEtZPgXA64x60vKz+3MYVmCshY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RtLtAUK3pluJ8Pp28A9kviO/QFQj30Q6bLQsMOJ0gdy2QO2uv
	siAJ4DmC4x9wdIUrw92MNkzpMQzHwEOaPiKIXE6wVhDbU+7gmor9FUl/
X-Gm-Gg: AZFdTZdMhBrRUf+sqAZuEDXH4Q33XdG/tRAzxDbhURKLPCgl20GfZSlQtnsQ75e9WBp
	uyBrqHqzJh5EPkpdFjauMIEX2czp1qq6FhlPbJdVhmqTvFAt2piI+bTZy9lMggz/9YYOUfHXr/A
	+cXWcZqEUCB2MhGn2ezy3tXnbuMxtzpFvwpMyRIwpK2xgKA9mGRP8pPMTr9R5I/kLtK1uxkWCQx
	QJpm2R0yhOvGL7rJMUS5JUiRwNjBQXSOgeu6DNY/NlvgXtOT3zaP0c0Ik1P7euhA8ZaDbw/v6An
	ewkjJ8TxlEfmf2CuN0O5+B7eeuoNsaneFRG+yXWaq+QqWbRmlp3eoMvhnOXzRP2qSyps30tBnm0
	nMsFtzl7Ujp4TAKB87YBRganVWdH2k8nXsOpTDQa1mxnNrW0H66kd7z1356rI111YZ1EZ0yN0bF
	Y/67SxHAg0gW6NFe6cTJWprX4OEjlzMUE03RpGs8WU+AldPDGgQ/Xgs9CO91yycfFSgKObdmj1G
	UsGdsJBkUytQHDFYMCvviElb70hhAo1W/Qhgez+bCXgom+1ce+8rAOXuV86aAikheJaWHSCd4rz
	RFN2B3UGctF8lPenwQSOaUd+JhHHD+VN6Go5o/3WY0l/e8gUFRex2GI=
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id ffacd0b85a97d-4abab02c469mr49831115f8f.2.1795818774858;
        Fri, 27 Nov 2026 14:32:54 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:54 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 0/3] power: supply: s2mu005-battery: add S2MU106
Date: Sat, 28 Nov 2026 01:32:52 +0300
Message-Id: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OQQ6CMBBFr0Jmbcm00hJdeQ/jopQpjKFAWjAmh
 LtbdOPyJe+//A0SRaYE12KDSC9OPI0Z1KkA19uxI8FtZlCojJRKi6TCKtEI3wlNyruquqBrCPJ
 gjuT5/Y3dHz9Oa/MktxyFw/BxCmLpI9m/qDRYV4hYnrWWtRFSLLbloV9TPnTrguWhdFOAff8A/
 VES0q4AAAA=
X-Change-ID: 20261125-s2mu106-fg-5e2fc4490cbe
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

Add the Samsung S2MU106 fuel gauge (found on the Samsung Galaxy XCover5,
Exynos850) to the s2mu005-battery driver. It has the same direct
voltage, current and state-of-charge registers as the S2MU005 but no
MONOUT averaging, so it gets its own compatible and match data. The
XCover5 does not wire the gauge's alert line, hence patch 2.

This supersedes the standalone s2mu106-fuelgauge series [1], as asked
by Kaustabh and Krzysztof.

[1] https://lore.kernel.org/all/20261117104328.1176951-1-tadilhusrev@gmail.com/

An AI coding assistant (Claude Code) helped compare the register maps
and draft these patches. I reviewed and tested them on the device.

Changes in v2:
- binding: add the compatible to the enum, no s2mu005 fallback
- shorter commit messages
- Link to v1: https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/

---
Adil Hüsrev Tepe (3):
      dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
      power: supply: s2mu005-battery: make the alert interrupt optional
      power: supply: s2mu005-battery: add S2MU106 support

 .../power/supply/samsung,s2mu005-fuel-gauge.yaml   |  1 +
 drivers/power/supply/s2mu005-battery.c             | 71 ++++++++++++++++++----
 2 files changed, 59 insertions(+), 13 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261125-s2mu106-fg-5e2fc4490cbe

Best regards,
--  
Adil Hüsrev Tepe <tadilhusrev@gmail.com>

