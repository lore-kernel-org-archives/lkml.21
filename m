Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186765;
	b=K+joR2gsxlp3yYdV6CeZk5mJJ2vfM7GhZzXaiCnDKgfXYaphg7ot4jjpNm1cfpzljzNd
	 9TfXhqUNufyI+TNnckfPLaBrIdLpX4Z0UPdSYQ5MEfejrw5HiZ869B02ajV2cUPNOADdW
	 lbj3eVjRkEqRw+/h9z6AgdcpFbAmgouwtpPd3sk+MqtCDz42gQqiHvlQHPXIVvNA/PdpE
	 XXOaYNGNKW9IMk6A7eMjG9895DneBqwtaCjoh4raTwKBddGW+f5ezIyBFStqsb3n2TPWc
	 UUrZ73c9wXF07W/tJbiRjNGZtvMiLVZP0zIWJSKotxowlIpvKH92KWx+CZOWlbWEA1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zBpLW0x8ZVchVdhStQD8QpkUQBh+hAeVrLYn+/WBzRc=;
	b=juqP3AepHobFo8CTUuXS46hD4/ETCN6pKI//iZ8wSAYuAWP1BQpIakHXnJN1xeAnbb1T
	 q0OOf0GGxzECqvMlD64Opf3YOcAsp3zQiffNKZBKHJsBwXI+oclULzu1TVxaJryQnMWBf
	 nEdKelk44rQUXSMd0IaqyGg7B6vMuRAXtHiPohIiR+/2VuN1RIxQEITT/saK/azwappmA
	 SRuqdRv6ClcfRm9cOVUSCU0lWirMOshij81vYlgN87y3PH1sm4slwiFJPDNu8ZuLnIt5g
	 CBAUVa0X9E/wJawNQaRtlsB5dmSlnrnxC3rEboY26lDNRe6Grq3vf+RuofV/4nE3U0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oTYu6TJA;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C614560A3810
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C614560A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oTYu6TJA
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso450241a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186764; x=1795791564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBpLW0x8ZVchVdhStQD8QpkUQBh+hAeVrLYn+/WBzRc=;
        b=oTYu6TJA/HT9v5Pt4CJo2mEpnEHUPOakjZIEx95IuY8Jb1EhiRu21yXlkZg/Rh8fm3
         tJYbd7/ad0D2wAPjqpPRwbeQMrxWctS8zqR+RtAwsJdUos05jDAF2t6sH3e50DokM1za
         plZGjmuLd+seev2t4qZ8hVvf5zDt5KQ8019J/yofkYADLxApBan9V0t90sNlT0UHQBu5
         4winSFSvteGdfzqTTbULSvhnB9aFHuTI+lAMnu7XzlCqy7Zsa9GsOHPGa2eR+9hNkbDh
         zSweGZJsPqXK5We4sgvsG2uPXuW2y091pK+D7Axpxmicj3kKWd3BR2x47x6h5ZxwWlTR
         n5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186764; x=1795791564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBpLW0x8ZVchVdhStQD8QpkUQBh+hAeVrLYn+/WBzRc=;
        b=EWOkJgMxF200CVzJHvQz3l/DddzJk1amBEG1owmxDkCooKBTisDTwDV5NvzMN4Xef7
         ZjoND7hRtA1qKQBiiLtOwcyZAukAXVXDv2UtIK2G7qDHWzUZ94hq1p8q8fFOdCkZPxBq
         zi3bqGP3lK8wetlEQRA1O9E2CGXRMxX7rP4Fosm6DlcfalLPz6XgwJheJThy3fZYEdOp
         Wjhfa7P4V0giMppvQXPuL0Qh7FExbM+Kcxvi/dWf6lxSmWCQTcr9i3CfM/72w3sUAwJu
         y0ureRCKzMZak8RNk8QNKS2Ke4lgC7Mrk3fxuSmZflbqst9s+c5POSTrmWTwFYBqPlFh
         oeSw==
X-Forwarded-Encrypted: i=1; AL+hErEzA15IBHLXz/EKGQEhH48LdYhDaFY9vGMAoi+NH39ON5mY4O6XDGiHCo6w6+siBtRzpWhwtJtR0rNECvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ueu0ejWIA5f6SSL71ISOozeYeFyInkU0wR/D0eZGj1pjTQduZ
	/FHIIsR1mC1PvNHSrUIdGfTg4W/rTE/emfBRsoKFtSM6mDROmKBms0N1ffh/qV+KCbc=
X-Gm-Gg: AYBFou3rxEgrUzLDa4G2ArYcFWSnN2gKNm++b2aawCLD20p0sJ9clicbk6WFPYMOQcV
	RWp0MM+tF6JekrQaqPPgaxF/vuIsUMpdYR2S2gT7Q9JbgUQmWfFsiq6L0VQk53e9vZeDJ5x9Fqm
	PlMMVVFv7fkmcTFS3aWnKbJJ8CB/MV+UjEhopn9vrjS6ndb6nQu1jWGLpmXiKP+Bc1nRX0cEHIR
	CKKch6bnCaC6imP0FY4/zkZTfww1FdIQa0UQAzM/FunH09dX27tfpAJY4TOEuIN/srJKp0KpQiL
	HWOyRRkC4MR5v5yhtgY5lb9IJay9JNFdCKlwiw2T1t+d7KMdmxwm5tySvaEO6YSdUS71kqUXDeJ
	GjAaYyZmrGJ7zteYLi2UtAn85iW9GYA4Z86x+Y6aJ3xGEZ4EVISgoVT436V2lHe+Xt/6pRKruCc
	qKUWBlxroxjX+5q7KWcANgrZFVyiHfD4hdHfQgVwxp51dp9YUmfkv0Uh7AsZUE1IhmqQiXBLHXe
	qJs8PGyq+omz+lU9T0Yvndrb5CmmyhHWNOrm2bapP/7d19B7OEqof29v514aCURZwvHzNYQchnB
	jdz+fjM5zSdr7Uoeu2zsCPqCeL4dIl1t0iY9423Wl5KPq6TA1UXZPM87eXE2JXkx9Z2UyHClJel
	XsLif9AcCPwsplaCa96e+aumhJsl3c04NUqOi
X-Received: by 2002:a05:6a21:898c:b0:3fb:5a07:e08b with SMTP id adf61e73a8af0-4014e255372mr2496997637.80.1795186764309;
        Fri, 20 Nov 2026 06:59:24 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc80d4sm1461584a12.6.2026.11.20.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com
Cc: mrangankar@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	michael.christie@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: qla4xxx: bound the ISP83xx reset template to its buffer
Date: Fri, 20 Nov 2026 23:59:18 +0900
Message-ID: <20261120145918.3127879-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010181139.1911817-1-yhlee@isslab.korea.ac.kr>
References: <20261010181139.1911817-1-yhlee@isslab.korea.ac.kr>
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

On Sun, Oct 11, 2026 at 03:11:38AM +0900, Yehyeong Lee wrote:
> qla4_83xx_read_reset_template() reads the reset template out of the
> adapter flash into a fixed buffer:

This is superseded by v3:
  https://lore.kernel.org/all/20261011144752.2063334-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
