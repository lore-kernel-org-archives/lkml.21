Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217751;
	b=PFSDWh2hRPczLJLkBxQhmKkusRVbDAK3N0PpMfMNEdFkhvR2q5LPjiThh+wamjFLuD+B
	 upmQbO4Cwp1zdp5vtYClh8rCdm+r77BlOrewmW0HvosNhryzfY3ufdvwbN/j9QqBHbJ/3
	 ceoRhnAeFqLjBoR5UcFkGgT3YmonCnf3O+moZxKxvnjrewNPfpvpVlgQjNd1B92Nrx40S
	 Ssc/3x9PW1SqDI5VV+RC3z93EF2UVtuRLnutSt1RolKM1zdS6rEm8f9/ss5pPIGiWuVQR
	 +tA7gN0bCWecLuaSgrC180rS3DOBB/W3N5L1+DczVUflpE68+s+BvnqPLplpY43fb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
	b=W7TWMGhtBFV6uLRwN1hGoxXfwP3SN0PKcc3gSPta3Kc6ZTFKIVl1OHEI+aZCcok+wHhr
	 mcpVOxpK8WfRh7Wzsb35OF/WJmsbO9CHuiQoGNrdodZbeeDXIT4Pju5iSJrizedNodhsI
	 sh4RLkYcqymf3+gTSJpA/OS3cTc5LXOYGsT9e/fgdYewtK1K+zqE8ElHzPCMaBoaRIKX0
	 ZpN9ilhELRRYjO6YN9wLhYpwbugQJ/TJt/Kvnj0kiHfa69y6JsH606qFsoOBZs6pwNKN+
	 halCXk+WO48mtyyFZBdhfr3YvMLRYnrxij3wPDK+1gjdJkcyjWt/HNDN5fcMLKzmzag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48AB606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so12632455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217746; x=1795822546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=Vh4V5h3wrScbR+aUpgN095jL+1i0bDxiHInNwG95ZLFvVbqjhUWEDU3gRRPGSzQv5o
         6PXI7x7HuFCm8Eehc9nYYw3RThyjB4D6VlNxuqYxTusJJwXyisj28FaF68bA/2gAJoH2
         /muws63J4fbwGqDaC+IDrSO3wORW+HoWjbF5gqs787TbaYWt1bFCJ+1AU/fEdbTJ+Mc9
         nlw10mUzcdLoL1MSHoU1UVniVxDuAJDxeyS4c+4cibZwQInSW48TBUDWQ5Jk2xuWN309
         x1tuO/14QgJV6dEi428tNIFH9/Vp9UuSwCq576p1qOwBqG33CAzpQlf0Ao/JKuiZhfe6
         iOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217746; x=1795822546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=QhONF+oY1IfUQN0gjC2jczWkYASsoi8OAB5vmoxYydur3YukMVOMh3GjBNYuyWyZz5
         +fQjVMLPqmpXVUaDEymkqiQp5SuUiapU5/jtQpVGnh0EjQqvc7CaZe2HmMlJD2oZHkiw
         uF4iicCelohsZBtvAUXqfronZzhYsYs9kntpjJvZgpP14da2KA9ywaI6cHBuXHsFH61y
         ajDPbluLSNOUuxcgs3j9g6CuwGc9RaGA9ucjSZQwogVVgTSEw+CI8UlSrFRJzrj/OFQ/
         Ghr7Tkbl25bBKupuqFur2YQzMVBVuq9PRTtTZvqS4MQE+6xrFXNwShcCIJNnOCrzSIkx
         MplA==
X-Forwarded-Encrypted: i=1; AL+hErGDThj0UfkJGk1Gj1df9BUDnqn2OA3m0jPLpGHEZVqFI7iHGkEZDsTBxQecNcgwo/QGdrjjYEWiViLf8F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o07Up1otVzeDlXMus0gnJA2nn9td6Ox5HvStwz4SCcLnlA2mN
	k0U+iQt7emBSd3YJ6CH9d9i455lJqWkTcaZn4P3IzdyMQ7jTrifHZ5IT
X-Gm-Gg: AYBFou1WEI8sQH7DLTkIdGXN6n7diT85jd+s+NCYrXJTBVLFaZkDLlV1YoHUS7kxJ01
	Dk0RrT3pEBUurBRshmEvaMkL32sigbj8MaoDXOvPQSGCZNb28n+MfijpKC6yTRInb6VyJv2SJuA
	EntCsncTP7XW+cQA2nefeeOYXC/F+L24Jc7r78zmP3f5YT2nPJlBY7xes+IBSC6wwhKpCUaRfz9
	yHlR+6tLy05PJrI7ZoZfK3GIsiWws3TcnSDm6GhOilLEx/pAd/muvua9nZm84kJTmmbGycu6iYv
	BRD9i/sX1P7JfbOOaTtDDEdyRwR0MketSWtjOQGzVdmA9VR4vyl8KDpRGfjS/hd6cjtKdNYaNbU
	SeEqjTpdwd6KYOFWOyZOHwNZgDIz6u9iTpgmKZQVtGmrJzaL+eI9cHdYzYKbzdwZSOiWdbvr2rf
	/3ds541eq/UoZe3yq8oT645yIAekMxjP/XOzVrdmpLSHptj1ZNgoCwRooYDQhU1HQMPbDYegZlo
	Lsb0VLW54Mouxts06gO789QeKDZX7UkrE3O1rNawtHBCTtuHnRjaAZ/DzZ309sQ7ejJZtRvTM36
	zCI1n1uhHphVENPeaXDYsi3Ym7p355/KosUfdIvuGJwsSf3sIZmyJH3y0L6B1NDACzMb9ceUx1s
	3gDv0sWHtxqXGCVPfRbgj7+jJGUE2Bj5E+yTLGZOssm7um8+IBCYt
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr108198535e9.5.1795217746082;
        Fri, 20 Nov 2026 15:35:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v14 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 00:35:28 +0100
Message-ID: <20261120233535.164885-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 390 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 448 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

