Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185719;
	b=t5UwNHMYZS0ZiYCN/1gU8Wr89Gsow9t7C2YmJYdckMpZeCKYunp+iXUWjlsKSiu9UZ64
	 VhUkdPknH2zy8yvTXRJ6oAYRBzk/b6v+SApGmbGvpNoutOOSjdsfGwEsZNqm04cokRw09
	 3osxm+5/KjM+LRwqE2AKNV4FxyD6/uoOFlmyqv8+TRQEdwig81bCc298d9T5xAZhVX/zk
	 FlGMzyMg0sPjhjbj2q2y8s8g0VvzemyVq05O7anXB4AHMMkymGaHqMqG0Ih4suc/v0D7j
	 F5tDaDfnDB/V03ik0VhAo4nzMAOZWoPFoJCmHJ5ZTu44NRmSEIddD1FOGw/ixFYvdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
	b=I1Nvxg/jHCo/jI3HZlJUB+mD2LAqzLBdtp9ggicfhVoduPt0zEIjS0y6sMlj03ZUaYv/
	 6cLhAc+uzmxsih69E1AtsSJ5ThGXYwnxi9df8ECcm0ZU52IN3puxj9B2rQA+UOhWyIAIt
	 IsPF3kM2FYXxvBD8+HbR6DWpazq8R/morU8V/maH0KvCgosMi9onoJRPq55WDY7ZaL1GB
	 X4/NSnjo/E0xpvHfETzUtuqk+QdX9cGgcvU+I+PJZLgxQIBcPxIL98WphcH/jiXT07Ew7
	 SQMG1ZQJEpyIu4utlEG2ECUKIRvxwiYWl9ALpyWh+bbeI3olZeViTRvxn0QC8NBG24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D73606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D73606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so8526025ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185719; x=1795790519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=HiASel8CxYyQ8aNgIRv1RIniEER6l7YpmzpLpGMLEl9BpNYU0y5PnV4kYvB432T7pJ
         9ECO334uzemuXBDQIcoE9CzqRJSCVI0HMRbWQBEOcz07Cn/C/ntMETzdl6RnLNpWICOk
         cZj0A//6vyjhPkBc8/HqNLVwQqG0DwhMP+b5FoCoi2HhYiuaavEzAhYMyN6VbOaV90sz
         J9i9meyDcm9UbygaK6Vi9jju5wTig4VWCUPkcyYYFKKdcKEpHQgN5jCNfgQo/cN/AFYS
         H+SyKHy2HziViLJrXBZ38ShNfupCeNWzw7ZkhqzGtxjO9z3ClpBsinxp9pZuy8NjmVZT
         fPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185719; x=1795790519;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=gY273s7ewXPnDR+fPTsa0TJZZ8ZfYS/LzQoF4+m9R8JSfBMn5y7pdhWOUjGpAUhIM6
         KlD7sYpo4R5DQ6Q30wUiXHOsFZuGcxOOLytQv5BcAwpHwfjfz3VS+pwwcnTHC0x0Qxc7
         odkvTLzA4d16GY1bHUt/D01dA423SHXKsnHH8KYHf/cSKa6ig24wHl9JknHZBiasF8UP
         ZKaMrY/qX3qm3FxOxL0P2GEH9rv6NHBuqhz/jhZtBdsn9c4q15yvfkseBiL1uo7DmwV7
         iczskzuxjBftgQuHWommYFK5Cfw5IG4fGY1F5zYlEIV6dJRbnMw8sbYIt684AsHfKKfw
         Hmxg==
X-Forwarded-Encrypted: i=1; AL+hErE4HkEVxdnazOLSv6LHgEP0Nj9gmkkLjSUbsCuMrPp5TJayT6VxA1HnzbQtZT0yxYJtJBuGt5tLAcOa5nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FDRpwtMW6SzY9DJrTy7RbBGfFiGvwolNHmhk8eQ4CGeyn0Fib
	lq0lI398GCgR+lM4yq8fqq23B0ekS8Fmf0c41fQgSiCJKfL4B0M2H+xm
X-Gm-Gg: AZFdTZeZ9LI/wzP8T4MmgGJlGMTM+XNg9zduOa+rdLlQBu3CtI6T8Z7W8jOA9GIqNx9
	/0TzqXa7RShPFvvKHRFFZQbsPhsi7cxG1e74lRjkAX0Qtwey5dKZucZb0NgY1iCnvRFLNIxu++f
	MFitrZF2QuFj8imLwkqCm/RZ051FvIi9fi9Ed34MaRwMo4kuuN9vUGF2Ntu7tDuJxI2sutQ+Rj8
	xD16yPuN+jJABe9hylCy4SJ0EDcLq+Kam5FjinKjzHF27whwSdfkhus4u9iSg1RQ9TsuOVD0VRJ
	zYkI7YOrsZciy/3k3vajfg51K5ifUD5Qf2egpKFtiuBq6hNTUDsNilyy+WpU2b6tvtprY0DL14Z
	QodkcaDuBjIt3/MUsaypdLrDoWy+mJ4r/L6K1WgTealaSnDbNmGEStmRFCA/DvNi5Q9u+ERsd1f
	nlCJlcwh5VPPE0m+QqUK4C1DOyJfKeVVQoMj03/sF1QG69YtWvNEUaHE+Nf2Vs2/181TJ9TirEr
	5GOE8/Itc/mrfKE9e7pCYv/1IsBCq7Y9PQ4M87lf6RheeNzCCUuPP23u9DrTbp2pSNsmW+JTlM3
	1gJ9J5d1zonqkozP+0/vZNqBSCwyzCGSyE7/Iq/V
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr33951835ad.46.1795185718476;
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] Add MT7629 RTC clock selection
Date: Fri, 20 Nov 2026 22:41:43 +0800
Message-Id: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/13NQQ6DIBCF4auQWTsNQ5WCq96jcQGISlK1AWJsj
 HdvcNn9e/93QPIx+AQtOyD6LaSwLtAyUTFwk1lGj6GHloHgQnItJNoa5/yQQmPMDh+1UoPRtSV
 joWLwiX4I+9V7dRUDa5JHG83iplJZ/J6xpIhIl/0UUl7j9+I3Kq9LIs7/pY2Qo28aeVeyHxTJ5
 zib8L65dYbuPM8f34Co78oAAAA=
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

First move the clock counts used by clk-mt7629.c out of the DT binding
header and into the driver. Then add clock IDs, the /1221 fixed-factor
clock and the RTC mux to allow selection of the approximately 32.76 kHz
source from device tree.

---
Changes in v2:
- Add a preparatory patch to move the TOP, INFRA, PERI and APMIXED
  clock counts from the DT binding header into clk-mt7629.c.
- Update CLK_TOP_NR_CLK in the driver patch instead of the binding patch.
- Rebase onto next-20261119.
- Link to v1: https://lore.kernel.org/r/20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com

---
Chuanhong Guo (3):
      clk: mediatek: mt7629: move clock counts out of DT bindings
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 12 ++++++++++++
 include/dt-bindings/clock/mt7629-clk.h |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

