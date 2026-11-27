Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802850;
	b=XnGo6tsahc8d1K9Ni39/YPzFtmw+jRM2+xzosRIbj8oGHbXrRX4yVQkO+lMre1SCV6r0
	 bQ+iJeDF9m7sMxLS61DCqnHP6nsXGJ16e7lUqqNR6DpHGyu5s8PvKwHmk5HtJSB9nOD3+
	 H+Ni40LZNO9+O4BqO4tGpdB1RZEc+KQcxTheTZa5T+pMWgw79bkzl7M7vOcQ+GrhIXsGX
	 d2qFSM8mExlkWq4o5VTqR1akukaDOs1gCaZLlWW+fL0D6X8i2vWJemY4HAwCo3ftgaqjn
	 gAJfZ1g54zpNUACj5T/pEhDxhSoh9l2Y+TACYHhbecTM31ix1ytxN0zG7sPGx5qa4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
	b=xjXnUSZ67zruXDnsqo2dOQMEZtOUTvWVA1+ctxTQkjgrGmdN4SlmsTmu+yehdSK6jPTQ
	 uA2/KQYZNfGfcHcEBtkpJt6Vep0Z0V+mGGfRhCsUjpvKMY1uuX+QwMrOh3nSF2IyhWERw
	 Wr95eEBu12zXD+h4Cm6N46fMI1KVhG7sYks4gNZCqYhR51zm/+Ksm2aJRl/wSMdsEikqZ
	 8ND2kRlayqYbamEQJLoMWUhqkR6E3hJtZHdxpRRbRdv7b/SL3DgDHWgoL1XiQ2LTMfdYR
	 zKp5a4k2U3ntNwFPWPWOskJ5d/yWyT6/+k6BKlpCp/UGCpbs9dXaj3iVQdEzQ2sdNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YH//X/sD";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE6606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DE6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH//X/sD
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-86298f9267fso4329277a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802849; x=1796407649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=YH//X/sDyNYNOHBaAeUfrxq4zbv0Gjdk/VHJMlUGlQmnWnDhW0f+L6o6yvirI71bGE
         tstTUlVXfnpQiZ78zUctggTBCfPlTNfexNqEenJDtB3uFeyLfuBSKWel1gqnpzN/dssH
         yjzqoZjTeJcGUju+55yLJ+B4Vg6KtX4068vYwoxsdZfLYlAWuL9qF8pSBo6qe+IOEddM
         +B9u1Ts7LX6QDbcBPZigRxujBezTRqbcU0JnQOwJduvDYjCrug198y8kI3WW0ZLPg5SO
         d6viRsM8Q0y84M55dQK1296sLNDtZp+HdHz/ACoA/MGGkyulIONAbzsGh9s3TyznnBTR
         vCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802849; x=1796407649;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=KUTPwe0G/LpozS/MRHUrkoKhhl9Xy+BP/s9DF8N59gyFHhjPjBK0qfR/cmkwmwS2zV
         fjo+t7ShgDo8AEFLQU1tKz9/zfihvtDqTLJBgXdRHuwG48e43RqZGFEoQTU4yy42QWRf
         KQKTiWfWBhwD++odLNMbmp3xrggA5oYt5Y6ZWGtm0jKSuQubAq1jgvlGhVn/DI1dgVUn
         1OkrtZAcHeqzExo3SWs9SyS1MftQUIf7Pt/O0uJEmGK9vUCmmtOFXNORrJ/b8S2vHrqa
         hJSPM6NkS/Qr+dHoeEh32sT044is82eM8ywBrJiUg9QPaBAngTXFpLL4LmG+PndVq0GC
         eyjQ==
X-Forwarded-Encrypted: i=1; AL+hErEoXz2IxXokMidj/NjUQt/pmF9d5il+/E+STPG+QDYwomZKu3lAGiWrTUKgVyeu9JxgCv3Y0OEq9Jt0s9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eM6Rs3kBIlYBFGhI59rSZAbSqZauk2iMMeoDCfXZld6bfDIha
	9xFLRebljOcfBbw5QCkzTgETM87KCIqjKOd3GVkuwmzWyOr48J+S3uia0bmOEZFW
X-Gm-Gg: AZFdTZcLhFdeg74SnvGo2Qf1zRU6JJRmX1iCd+DtfsR0KrRZzBVcpl//QW3my3SeDhm
	5H1CvyhO9a3IcVp8xOsoHS9p2Em+nVSn2D12fh+zRwuLIFuxJ6bU7j6rnxyLEQ1ris7VYvjExXs
	YqRZ13khUSHWnsvk12PrGEE6x7jhNxI+IB3FCiAHE3xPkZb+T03P4jMFbQiLIGZNbZSNMA1HKx8
	PYQd/FGremDCtPihN/QAo7D2NUINPh/SvmUpuInvB57p7SA3Edrddy6fpUFUffopEdLTzy6VZeX
	vMi+Q5n4c1998SjihLftLhIQOd2xp3p2vDKL8U+p+8Mc23unMDMrUr4DsDvRFa1CGi7wEPscqMY
	Nv0iz5QJ+dks8n97I2H1p7en760SyIWf0bNSbSdkvnjkyGRdC0J9Jb2DmrxhPlnie58UmCqAPcb
	H/DMHnO7Zr0jU07RVTct+DkiKYsVYcn39/skEYn1iy+F7Ph7ko5wlD0rT7DKGxbwFj4R+5pfbqb
	2pSdGT2/wTkewFtF1OnynxM4xrVgsK9j6QEKVYM6Qv6XKJt8ukSCCHnWQq8eAsjbMYOwYqUJVXa
	IeJrl/lmPz/g2CbE559oQFsvxdM3VX8YpGW+bF9wHyu9T3C01adREjYQpgncVS0HMyeCxj1kJvr
	F7GEjRw==
X-Received: by 2002:a05:6830:230d:b0:862:9fb5:82a7 with SMTP id 46e09a7af769-86315979712mr26463348a34.21.1795802848575;
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdc75sm19369574a34.8.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Fri, 27 Nov 2026 13:07:26 -0500
Message-ID: <20261127-a733-dt-v6-04-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-5@gmail.com> <1jik1ild9n.fsf@starbuckisacylon.baylibre.com> <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

> Ah, indeed, good catch.

Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
patch.

On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
the A7S and A7Z? The schema still accepts the old name (deprecated), and
CHECK_DTBS is clean.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and your reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
