Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937328;
	b=SEvuPYJr2EhGXOCQDaNTOLhDXhk/ZfC47ya5N6j7zMSPeq1qlUktVrOANkFsl8Q9BiB+
	 9byN7+WC689XxYyWMTfT74ctr+VY0hwBrz6eSl1ZWWQQsBk7cIR2NltWvYE5Jz3DTDGPb
	 7fT2eDgullHhOU+YrOtmtpfjFXQXwLled5eHgEi06tBgjNOy/nvol2XVZS91+O0Naty3W
	 RRFjerALpKCFXXwSLAVl/GeBv5mpb1xR4vCkjK/YTB7nuGN0+TFdoC7ESj72RCvGNPqIV
	 eroaf4sKOd1XCF1NCJfnWc0IgGSa2aJ/WnHpMILIkuj2SqPYfCC8dHBun8U470JqogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
	b=dc/GJ6GhdQVrjg+gRQYN5c/nM3D+PjYLkjG02id+ZJH8Fl8/EYcUawsgm5nrKmJX1PFE
	 +B5mKnE6llUnPJix9cBQsmUE67f/8L2dCaSi7qyLa91f4uEB6u/4ba7U71VaxxyWq/mI3
	 XJZNAMpADQdg+Yk+TD2e8GnRNDtZfpNU4XK2zCr3FKknAOFueajCgTE9OL6j3sOdZleXh
	 raUKufktEqZ3v8uSeVqQ5uQmYjxmTK1wqXaIbudQ/U07Ll2x5EO4p6IfS7MogFW3MRPNg
	 ogQUENBAae1agmw3I2ZT8TqlgwkdUwk6TzGH2FEj1NyqWBlpSXIf/NLc+EdnNI6aaiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883A606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B883A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1168085e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937326; x=1795542126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=EDwh4KfThj9gvgd4ZiID54fBn43gGzte/ynCoDYEqJkB2FDrv4Gf/YpoLOTiiC15cD
         jtT3YQwl8mXytztDAUQUB0F3f5wsC/dGO96h8RGOCu9ocl3nTFJbLm3zC3EVCK9Bk1W+
         U+g6qQRqQ7ewtsQJLqe6lqKVT9qiGvEIP9ZNwZTttxt1Ag/XzfmG3wpCADEEHewCwlKQ
         3+AGbySErlBLCYMVTdnqo6Su9Hy9trzoBcpIgacMj7zNek9dyKZb/SHJpUGr1wlAAncp
         Tu4sDAz6ONg4yU8BDjCK7gjyAYTaXN7lT/790myHY6tXv0h1SRhHu5IUE5OVwoLk2Doy
         ycXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937326; x=1795542126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=iZ4CQtONrabIF0oW90fQgOg7TA2zOwuVc8Vo2KvKiA3C3LwQPj4EWaDjgXSDxAgd8Y
         egHiRy3KTeJqhS4nRZkY5eyc+2Vl1AcAgA8yogQbABiWfIWnYaAHIQVpPPRmNoTIloya
         Mvr9Db9qPuLvvECQePRAN1Lkq5Jc4CdM0Dy4ax5v2RoyBQ86muADqDkvgTsJSanCYkzU
         0HIht1F/LPiPcMLM+auzDMBvL+myvJNo7ASxXhg5a38agvQbzULhPo6Q160dMsrI/en6
         q8nReVudvR0+03/KX73mYj/low9T9xVLyRmu6yE0kGMp73jYFVZ1SkoZ80MKdGIiPITi
         6Aww==
X-Forwarded-Encrypted: i=1; AL+hErFNiYEgci0dVWrab+4XVG5MwDcrW9D9g1sZPdCu+I0BHfKzzWUBRRw1QFVXYyl7ukXQjxmiU3GjelVtoeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UtW1XlFlsEeBFfiU3XORcTo7UEugkmQtf1rAPaMdgouLpG1Yo
	ghLo+ghMTRF8en86CFWLJmSTpg0tea+Ge3abxiKICSwabSvbQ6Z8GfvJ
X-Gm-Gg: AYBFou1ct26kiiw+YnhZiCUeAunL7j/mT73qp9JepuZM865fCSI5F0Nje8hUkzoB+an
	sH9Ch9C8gzshwQNBVlr4mHxZ54QuodoPeSDuhKZwTnwJJcbcJkw2QRn5UHSLdQZw8NjtOMUez/b
	c6ZsrBiXZfvSTirihD8VwL2V6in3iDGdJ0l8XcggCvdzZqgO5uVIGMnHT175AFiEudo7acI2vwZ
	PeyU15koSzg09MZybEDr4ohen6rfRAChVUx82QHoZwM7SUtdUSdhHfd4zVrbNrGUSXuKxMLiqwM
	kOaitfI0pSoyvKiLUyiNIPcVbzoQlsGTAUsHcUxFJ5hSunIuy2WIqsEx+/HYaPioz36XEwjZMb+
	2ct0QhnSyfyslvVrhVFsJlEOVs4ORd8m2eVblpTMpbFdpnSineerPzn6di9QIrb1lqm9UI5rZVZ
	rhflar2bxwWzJDHmqrpaN7taW8U/DWwukxN9UnK2ee8oZU1qEP29yy3TPHbvWEBd77ZIxlPxIGw
	YtSfV63IVie2ufx3MRjm+2NYEq+tmlb1WMw0cTuSSPtvRTMzuy/XxUzctjxrtwP27YmradY+mUm
	lv9H0SE/4awDAfjs2LWl0FmEGnoUaO/f21wiSLF8wLbR63NdckfmfX+7aEI1yIKB3vjFjP6McFc
	d1ZIg
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr207958615e9.8.1794937325497;
        Tue, 17 Nov 2026 09:42:05 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:04 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add ath12k calibration variant for Silex SX-PCEBE on Aquila AM69
Date: Tue, 17 Nov 2026 17:41:54 +0000
Message-ID: <20261117174154.549590-4-ivitro@gmail.com>
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

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The module
reports the same PCI and QMI IDs as other WCN7850 designs, and its board
data also comes in variants for different regulatory domains. The IDs
alone therefore cannot identify the right board data. Patch 2 describes
the Wi-Fi device and sets qcom,calibration-variant to select it.

The qcom,ath12k binding requires all nine WCN7850 supplies, which only
fits designs with the chip on the board and its PMU described in DT. On
modules like the SX-PCEBE, the PMU is on the module and powered from the
slot, so there are no supplies to describe. Patch 1 makes them optional.

Patch 1 is for ath-next, patch 2 for ti-k3-dts-next. Patch 2 also relies
on commit 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration
variant for WCN7850"), already in ath-next. There is no build dependency;
until both binding changes are merged, dtbs_check reports the missing
supplies and qcom,calibration-variant for the AM69 Wi-Fi node.

Based on ath/ath-next.

Vitor Soares (2):
  dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
  arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant

 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 15 +++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

