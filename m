Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557104;
	b=Yxtod9A03jZwgJssCUFFZGectXBeDWNB9lJxH9C0GSioMK2eKFPrNWXBfgxT9scLPSUr
	 X7c9dTQ++Kbi8hiaw9HfpuwW0b3xA7gulnn+v8tLXoKL6JBBNWeVxkymEVtbkM3Gn3I6m
	 og3Edbg2MM5OiIMwSQn9JiIyLdGRpwIygMq1QN72Wz6Bc6upyHojQmeiu/MRACbMdGFpN
	 LFVzUArcMEp78rXn1GKCyfUU+zl0lC8uFl/n8ai4LpL1RiHA33ngTcZ55BRDfrzvakq0s
	 4aY0Hf8peaP/2YO4MGg1d73pZQ+zo2beO5eZdGnf7IM6k78hvML3cpduUv51W0ajfSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
	b=iiTrWcSjd3XalzZ6D97sSTzuoglg8lGzIAraHgA4nGCofFQzKzj7xFSHMk3bCxryPxTp
	 v4F3hZV5EjEnUKA8eob7MkyN2/wGH19O3tdkZtAATkV/R9P6tvvTm/JjIAgX75pdCP85z
	 1o1r3+1nxL8ojISNFMAv5tYiwMijAYIn7G9G0ci6HPTBYHTc6jU/F/34PI5SRPg0vM9nN
	 kChgNfvO2S2ISMgRFrnE+RpyQm47hi5uz5ZpzHnIotL7/JQCpXvahl6Kg5/rr3dVj/QSP
	 OUwzCHgK0yZHnAMlUmHU/09bEXfIJM88ttS50dSPt8+PCXuCD1KrsAHzAkkrFUI6CoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE648606A686
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE648606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4471201f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557101; x=1796161901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=FmqJqJB67hQrYyaw6JTpSrEOH6WEyZZtcyc5plL8wcZ2keR3VpkWteBgkxRsITP/CZ
         b4J5DSAB2F4oKLbJzWI3QWjUdVmJVtg8k6/Bn5xb3PG5mbq2TEKjdItfhGAv74smzepA
         fwyj5+cySHUuzGVweJ6u6bNnzA9IWOnnpJhGRBuMaAypQwp97X4BDJSOghVxCza5T1E9
         Fw3AxXJCT5Fq0d1pYHNSr94fRnVayeTzufkp81Z/OKs/wStM7rW4FhxYTtBOrP3OnpD7
         MYJGMCMKq9YE334Lle1k5MK5SYkmspKRi7PL18Zt9eIH7QGg0FDy52PLHdqZnFQfl9D4
         8RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557101; x=1796161901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=GQSKcK/nw0ucxZuqv2JvwXi9ilDENW7NPsRkJDgMwHX5BQvCqgkskCPF5bWqVYGmI/
         infkpDWb2GRK+Ln1z1xnxVoEDpoCK4zco90m/01bwboIsrcZ5ETUX1UpkBM2wMUcRVPs
         7z4S7W1z0FIVhi4FwY6PeePK3OogRy3iOwjhuOAogjPlO06UgozrzEnoJDZESRECaQqX
         je8drtM9/pFtG4kbpsJCItVvEP6YkgNcpLIgg6Bn7jonxXOci/5au4cdQJ4dh3fZTR8x
         mijCSVSxhSuB5YwC8e4Jg8RH18uCruCyNd2AMhjp1TikFhm2vOAGy1bXtNOGJY4I2lWX
         dFHg==
X-Forwarded-Encrypted: i=1; AL+hErEY5igC2uaScYmvfzC/Kb1Ub8NfeH6dw1JFQde1vo+0bHRcb8rU82X3yGIRTa4g2VP1DSeHgWVQj3hH9vM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qvn/HCl/WpXsKAqBabW68jR2aEVXhP+CmR4o1W3pUUJCJRW75
	938bHgwVx4IokSRMnGfsJ2m68ExuikwGkrH0I7tK9S4PmYxG8JrPWBwg
X-Gm-Gg: AZFdTZc66zuFv73rDsw5m1ML+idAe2Yxwujk8fxBvlhtga30sMC2CdtJbyR5iYON9XL
	QHqkxvelOBxCQ/JqYfJGSQz/uNaA4sgdiSmLUgJ9f7TVCUC+xGVbOZaIGnjgopN4dPijldFoq+X
	wx3WMNsWccR+QjwqiOYG0iZFIRIPJM6eytTQz/7E3wm5QP4Bqepx60S7GARcLEaGS4u6poRW87Q
	cESRYkIbtRrzGkWTvZu7xqS0xTQncVzBgugN63IILxMuFPmo0lR55ib0DlWBlhZzsjLAUXlULwG
	EmrqW0WEwmGsIm9rjBcn4egUuU+dNTWXA2/npJqv95uv/AeNIjmCw/hgNlxu3YhCR48xfwKftrg
	+xR0/qyTMe2q3SyVR2RPDYbE3VAOvqeVZ8RYdbNwiZUo5URjAHBzFICA2QueoRiv8BVnfg2tL/V
	MRqHNyjbA00AXURUgiVUOu7xxDlI17qoOlxRmZFQ50lVZgBp/v082EgoO1uJK85qJrugY3kudBN
	Ut4YY7f2jXBLlw+s9ZP7p0XtSCf1eGtboJ3bBhY8qMjyEOIKKEkz3JNc9g+hSFPLBJNmKCMmO9y
	Z0UVy0bnzgnvYpgopyo2mlkAqiEXrXO6QzTAg3MpxA==
X-Received: by 2002:a5d:5d87:0:b0:4b8:db69:1b4a with SMTP id ffacd0b85a97d-4b8db691b7fmr2464923f8f.55.1795557101212;
        Tue, 24 Nov 2026 13:51:41 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:40 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:45 +0000
Message-ID: <20261124215048.42074-1-pmazzini@gmail.com>
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

RESEND:
- rebased on v7.4-rc1, no changes
- add Rob's ack on 2/3

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.1

