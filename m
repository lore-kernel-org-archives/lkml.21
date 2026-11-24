Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559103;
	b=WAMsy+Yq0FXXGJpdV+9lLBNjw5XIRB+f1ujqbt9DT/3pCWxKpvlZsoyfLXDBWIYzSDyJ
	 3p285jcUNYqYuHbjGo9tthjTC70vGakhTdkvmXPg5yXKcnFqxnyZcj+gmEirNch+Jhylw
	 YuzIofqUbVPka/QH/lFh43wpCUNS0MQaL4rvfzWIkgtaOzH+iI42pdZqVoTIaFZ7i/Jc8
	 ItuvL3t/vOzGP8qUhu1SgSIc/5cj2M+t2P/zcRhcEZU+YB6vfmXsUL9XRCpWiLraMGjDL
	 qpHMkoKoU6ojK8pjM1KyWwhLV6+l0hP/y8gqfzz4CE73NjvNKp6zTxW7Qshrfca95sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
	b=5Ow6m8Qm96LvlQU9ZgoFCRbOwUMpWaUYHjnlzOxv7GWCZxWA9uxVu2paHRmQUoGDpUeJ
	 YuibjrRIDSqT+tkzKpB9QYTdfH84To0AM7syC8Wlx6VYz8kysb9t6hvTxCbeG3VQoJ/Xy
	 QtgLLSw/tcXZKufcT4sprTCknyWjSPs0DU220NmyHlb9QXHQKQA1EI+Zsrp017dxHQVYq
	 OugxHnSgsn88xqL2JfQPFsMCDab/d97wNRwACisQZst7ckUrltGx2SOm26GpdzHKrOag2
	 H8oiDcrgF9pkO2gU4Tytw6g3+fckeCmljta5X20eMhPec0YcnJk3clH9IFaF9D6kHuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWDz3CVg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D2606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0D2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWDz3CVg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so49796685e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559102; x=1796163902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
        b=pWDz3CVg5d+nfg4CruOyXugT00Ckw32IGIGSY6UI3c6vndOGC1/B5sZ66UL3xNthsA
         vA3miDdy2C2/QAx6+/Ac+8GWz74BJ4RpMvu4PlUXKNfR8+5V1STKMWlQj42FoDAdiyK3
         cYi3wm/iYhdGplXXLHQlIE/doc+UoPyrcRf0uDv/jJwOFJLLvarQaP+futDgXujRsFy8
         2lGyeU5mTekqvMCtJAoLkQahXsMsPgJ+sLcA3j9SDRiNxACQiP3YCjH7UDvQAsopFomI
         tIAcqoJRak947FzVg5Kv6LpNmyWE0FDJGJE1AbHIn/WuHcEm6OBKjbq85zgrfanKXVkx
         2u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559102; x=1796163902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
        b=FLYjxvuUZAnOiGyrrK+81rHZccGYj61GkoaBPe9LKYfmKy9o/1Hgg9ct2IqylcmC0n
         8YvAtFO9IGYuegp4ZRtJw+/tEIChXy/iBBpyIXomNWbfjsPOUFo6LYUKzl98k4/YXiaK
         U30TCyFZcE0RgoZEonzLxbsahxwGqyy/lNGkueg9WQoyCWS0q1BmDsWkSQ4iryzFtgGR
         L7KCJNez6Z0UQVBRFYFFP7X0F/8NF8szVUcWkWGyFabs3aqHCU0rDjI79r6B6b4+eYxi
         ugO2yMuPmoFkpm2hBIZED0G+oOtF+JJNPKba/JeBkc8GxEGCOglRqm1P4AVQvd+PuPz+
         svvQ==
X-Forwarded-Encrypted: i=1; AL+hErFENxy5Qt7kCpYUee5CBOMNsoYC3gk2d60R236XcNsbTfRCPG9y0El8d0oBhJu7cd5BcGOglBwJ7LbjcDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YP4I+uHUIuqvfTO7CLNhH7+BBEzBKBpJYZv22yaQPOn1nDvsx
	cnaHLC8j92Rr21TnGh+hnKedSHqJkJ9AECwIoDo0J4yQvPVHFH8DiDij
X-Gm-Gg: AZFdTZfXtM2FYw0Lbwvqb2t/WEqOyNqEq/YSoRoQjVjW7OWkW5reCKi8IvhVp2/fhAh
	aPGJY47OooBqgBxBFmIjVvYB5lS7fqvOT++VlrlaKel5LTFkHH1JOsHVUUr2HLkpjshQHILpI9M
	Tk0SqeTj9JzdPLhG5kGyytW+C3VR2qhTwjvHoWINyqXQdiTe1+cXEyGamsavVtqINClTTVIQZiv
	Ob94t7sqk4aiPTHtH1NW3pSZVuMo4Q+M4/w9IaCcDtDEtOysNkcsH9lkQTIc7jEqzFe7z4Iy0gg
	jxc8CtuuovVfz4cgzq07xlu+sfluhCHecij2wxwrcKrphgvXi9y77U6EH5v1LnnM1oQ9w1yi9/Z
	BP8vMx+fPMw9gCN0iY05l36ism2p16p+CKN+1odLzKfvfsyLb1yZsKTG6oX7a7fy9dld1sxjUlJ
	D1QBWUZkv8lOjmt+gfWbpD6eU2YIAfWFvSmLawQXbkfmHcsgRGpTeyr/Zn8z1mtk4SAoF+nf0Sh
	RdxsNJg4nRABGQUPLmf4Qd6QEFuCOksDyti5iqTA34Hm4iedqCDPzgpuW4c60OmUGlN6KKm3Rgn
	au967yamGLfrkZt8JJJvCNEt4OfVut3JiMdjjK4V1NtwH9p9aWbKS/f9WC+k/K6XdgfdNu4GmIv
	9pQk=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr352097065e9.28.1795559101478;
        Tue, 24 Nov 2026 14:25:01 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:01 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Tue, 24 Nov 2026 23:24:30 +0100
Message-ID: <20261124222452.219832-1-ansuelsmth@gmail.com>
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

This small series add support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v5:
- Rebase on top of phy/next
- Add Tested-by tag

Changes v4:
- Fix typo for Documentation patch
- Fix wrong regex for usb subnode for Documentation patch
- Improve register example for Documentation patch
- Address bugs reported by bot (off-by one and xlate function)
  Link: https://lore.kernel.org/all/20260901123933.15388-1-ansuelsmth@gmail.com

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY
  Link: https://lore.kernel.org/all/20260827131551.26725-1-ansuelsmth@gmail.com/

Changes v2:
- Add Documentation
- Out of RFC
- Rework to Serdes PHY instead of SCU (following
  for consistency AN7581 implementation)
  Link: https://lore.kernel.org/all/20260811124724.702467-1-ansuelsmth@gmail.com/

Christian Marangi (3):
  dt-bindings: phy: airoha: Document support for AN7583 USB PHY
  dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
  phy: airoha: Add support for Airoha AN7583 USB PHY

 .../phy/airoha,an7583-pcie-gen2-phy.yaml      |   63 +
 .../bindings/phy/airoha,an7583-usb-phy.yaml   |  133 ++
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    1 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2023 +++++++++++++++++
 5 files changed, 2231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.55.0

