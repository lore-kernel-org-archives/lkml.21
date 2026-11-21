Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290596;
	b=dCDDp3thoXVWIIXS+L7xYUnsxF3UrgRweOnpnnsuu0ddw2bidGGXk6PJGDyPxmX09yjU
	 9hXMPM4E32euZfHSDG1+8b64rib6FPnlT9G0cZBgpxhPWLKRQtw4MZAXYJNfWCoEhfzrP
	 Ifc2qYEZQzq9h7vjmkXsudKkB+P/n/jpQqurOMguUPdx6v10+SDMqIx7qT8OTMuC4fRVK
	 oRBNQ7zYKnls9YujfsIa4ZCWaFA/Gwl4zmz7/IICwuKdDjiJgyVLlX3xOLOzwOYmuJhms
	 f7RPcpfSL1kmKdiUEfnvTcsEn7ECfy2luQPoHarRPHvCFVNv1fOyWhjDurpvR6FGyaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
	b=Y8WWWgDVLT7VN5MrrRSXrNwBBUOwZJ+ObGedsCCSFaAnIBXzR+y7K/t1jz6nvnj2D+2+
	 Kv+etBqr5idCHb1qPD1DRO1mMp11MUIHa47lbFfamrMepnsHcbR5djmjeS84W8IW66IsT
	 p1oENgRBMce+gtgBpg++XCpMa66hh/bww91qLXo50cKc7MjbfjXp6rBR+GJ5x+ScO5rTr
	 EDRu6GJsyTopIpdR+dE1UEq/ebbQvkOvQ6I9wN/mT7O3FDBL0a7D5idO2f4QoG5jVyMz2
	 ClRwfwAF57/Zr/7+YU1EmNgARrZMKyBh+OHDGqB+PaE4ujmrJC1taFBiNz9OcgFdKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOd3a2s1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526B5606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOd3a2s1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so18294175e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290595; x=1795895395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=iOd3a2s1ZmQSjw+L0eJ8WMEhtEeC40eT/cM3QIKCkqIaGGJKnP1dvzgGSK1YJ9UIZF
         IaK2FAZ5ilyEtX+2mL8vbW+wsM+y7pwdDZ1wmmdTpEFtTRtn73mdCsGq+Y9ZEjrec687
         VbVxsOoexRUHCZyZXbI3laqH7k5ImBal8GxCQHLSSvfp57L9+MFtMVvX3PIpbe6CwXmR
         n+VLhZ9IhGvO/SaI65UgVn3BAqWLA7brCPZ/m2EQfB3dgnqh07B3O9q6gUIb06HrQLXZ
         b8EcphdJaxrnXF7oIn+iVKYyFY+6N4BkU15DJEglsk6rs0zXd2ZOxlO88Omr0iIPNAXn
         aT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290595; x=1795895395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=LuaWdZ7sp+zFhX4FkwKNH7xrBJshi1dFFB/4KkjxZTJKGNVGHInViVmTGnWK9IBNWS
         xiYNy+n4N1Tk5ALZH8QCBFdzx5Se5QaMl11nyNHQEIoDyaS5NmWcuXDSPobZMcDsdzEx
         P3T7ol8mkA+9L1As953W8d3avNQpVhqJcK4LsGIwUh0yTFpXXiNHgekAlrim8iJirtoI
         zYMYXRt6CQI7O03l4/DHTw14aFGeg5Ptxc4RArl7aBH1P341eXUe0gQOaWoyHpF+jTx6
         LPSYk4PyXsrNQyquIYKr2YTuR8Y9vYg1byJ0A9dsStwGmoY12vA0gt9rElRh8GBSfMmj
         rOWw==
X-Forwarded-Encrypted: i=1; AL+hErG6VlIX+qEjyI2/NXTXQYRKztHlgdfxqOMuRVXK2E6PcrbFUDvKJmLhhUf712D7Ruxz4A9NlbVtaghQ7qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R0ltsZ3GCBIosvBST8QvDZPqi4ReOLo/1BVbuDlaQB2bgWvth
	f2Avd6kk2TDFRZ7D4clRLf8DPVCCjApm+r5Z/w7H2U7W4YFpXee9l+aP
X-Gm-Gg: AZFdTZdY6AxVlQglvtmtruqiKb8l/x6Zp+T8QhbA1svsRH+0BA/fxqYxyb/cv0xfK4u
	RAiLMPXqx91n44iJcWexZeIpw2UF0HnYkBGYf3V19cOh0qmAeSvsUJImR3KefT3puEUB+AosRpV
	Z8ck5exKT92Kbd1dhDc+fvwBzw5UIsVytRyXF5Zn8UHR4RHSW8vzAoJZqlLC/M4KM62NT+XwodD
	OYUijyAH2s0sPD7A0o0o9w+TbXUg251R5ZlQ3HMqKOCHiMRJectxK2dBCjl3S4i4yvHkqpNszVf
	r417b9FotapN2k8pgm/WZTRbi/wOKLHfIrQmqhStEeH8kyfspoPDNuYvuirL0vxiyJky6Gjf1uv
	8V+/2YFBzOJh1Rc0KdVWFyioLr+Ro2667263iOJldi+Iqi2WY5Cl/abAwTboxFC0KeZf76Hm8xY
	YNEPxQhmWmRvXBVibEvGp6239WWp0KtFKoevO9zQGATCt+40vwwLmvCWXKcaMq8FGDbs6Sm1t20
	lgMWA8UkaT5P6D6YcwijYiRK3ZUkFjPo28Ep9Llo5wOfFoiAMrZtppY0ZcPjyCIpTbPbuVXF2AS
	1WdtBjwOWBZjDCCxmVHtNnVE3LUm+RHtbDDHYg==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr146998045e9.16.1795290594502;
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 0/3] wifi: ath10k: firmware feature bits for WCN3990 on SDM660
Date: Sat, 21 Nov 2026 20:49:36 +0100
Message-ID: <20261121194939.3647400-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The WCN3990 firmware shipped for SDM660 devices crashes on two WMI
requests that ath10k sends by default (scan channel stats events and
pdev quiet mode), and finds no 5 GHz BSS when 5 GHz channels are
scanned actively.

Rather than adding chip checks, add three firmware feature bits so the
affected firmware images opt in through firmware-N.bin. Nothing changes
for firmware that does not set them. The ath10k-fwencoder change in
qca-swiss-army-knife to set the new names will be sent separately.

Tested on SDM660 (WCN3990).

Gianluca Boiano (3):
  wifi: ath10k: add firmware feature bit to skip channel stats events
  wifi: ath10k: add firmware feature bit to skip quiet mode
  wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz

 drivers/net/wireless/ath/ath10k/core.c    |  3 +++
 drivers/net/wireless/ath/ath10k/core.h    | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c     |  5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c |  5 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  4 +++-
 5 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.56.1

