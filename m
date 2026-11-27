Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787132;
	b=BFHRjR6U0UOqkFOznIPOyKC6VzlZU3fD45BN9gB1ZcIxspdy2hoVQD+sl7cRrW1fauwX
	 YkMzXTOh7SyW4txH3I6RuYQN7gtUUw+nURh+TYdXOIZL0D+hOJQmcGpEVcFQn1hQkOksc
	 zcNiS3lHflOzcyBDDHk5QOQMQkLOiEnlWcM0SBh3GKh3+ZOOVFE54tF690xkQBg4cztY0
	 YAyaPX3koOy8+lxEaNhrLoA7Ul9iwUzoglyYkPSdE9oIEpXf/g6SSfzdVd01LnFdDXHzC
	 ys58o7hijEVKf1r87Al0C6ygh3fkSQP6D+DNf5oKY7qmfHSaLmTot/7jvUYyN2YWQhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=AH1Bd21lkQRCbu6g4Z6qZMPUtrKC0WJhiIBpKLFkPMGCDtZ+tQSKrk89ULkr/Sp7s1pl
	 4cVZl0ka6gI1stsQQCBwByHrJvhI7EJfDUaaAwbT1gQIEGheqhDcLhNHIhSZo/WqQ+kKu
	 aAqnE4974N/1bUCSpjsV6XLBnnmHgyxbNuwfvQ2kj6mSQa9goaSZqnO7TYqDfKp2Wahpr
	 faZVw+5W6trEMMD8xx/ojam7nXWy9Qw9QzV9l+fvwdvxWqxKszinuJtA+2m8jlOPWPIsK
	 3PYSzs1jWVDXxDHfEOHVyhSbTNEUp+oLN/z/qIBbz8qAgHmQ3XEWp2BWb1f2E63QVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E427606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E427606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f07a960666so57502455ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787132; x=1796391932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PivZWo8Rof7K6W9Vheb0qp0zThUzh9oIVDgxc6i3q6xWx/3NrfyXUY9IA3TQRrg1KS
         87/9gnEPwQJghnt4GOIQu1d/7nHtLh7YyK3tzfpCIGi4kfTjK0xSJhvP3i5MjA9i34K5
         5+9amcagsLV30MUbkjRVZFuaQaWkFGwV7DXBKQt46IDPdNi1ADSQrkTLEJ8yad+fMHSA
         SHxNYXroc3W87etzrXbTif1r5krOcCxjXTn0SOc65Z68yE28tlLl615HRgWjQyEJtXzh
         mfcaRJp5cLzkTZ0Culgxn0PvYL58NGjpyjt/p3lhM3ImtleycWA/Q7jXXRplaRa2jbRj
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787132; x=1796391932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=BWcunbKPA4j93ktB2fZH9nZi7JE2ClcK4yIJHAS963nto73qMY3Ri26KIzWp3j3DBs
         PTSDDJ16spAtjP/46/gL8NrCfDticuXCe0vrkTYYrk7aK3iyCm9H4R3HltaZe7JCukWY
         YH9f56nZ3VSbXOjxv1FbK3icK2ilKbmo74JB689TwaUlqodB25kWlz8OWgNXoABj8VPX
         /Qv8fTEJBfUG9iqAMG+dLDbMOz+IVVKw8DgOkXALVBsS0VS1uox2NbiPIML6N7bxuOP6
         li+GwOfVPhF52HY6QjxCU9YI564MxSvP2K2Hrj9KzWw3wEatXbDK8RntytD83bGlNIPJ
         VKoA==
X-Forwarded-Encrypted: i=1; AL+hErGxm8NE8iNck/ikro+9qNF7iof5HZrs5xLsMz7w6bLBHtneSzB8Arnj5c70fwcyOc2dBSCazmhU68ElNn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WSeSocnWz+r4CyVm6SCNB3LWwdWZ742HDabFHxSzzz6XGu963
	e3MHX/hOLu1aP+jocGiooyREjLsVqH4TzN4ygEJfBT3KId6UMd6voAZW
X-Gm-Gg: AZFdTZchVXcnxpUC9zww3th7Y5mxy+Vhi7JRXY5xp5T0z9heeV1A7EVnonCM6ZqnZye
	EqO2wlVzsMUSM7RwINxLtVp0JkOjbTf8BXgW/WXnb3SunH+SQdNlG0M6V9P23CCVA8ot88G07Od
	oQDXcViVNl36JRHIgJcq1UrxGEquefHUHl4WveZ8gMoHPgvSeeNdRt4MbzSu8j8uapXUSoLKKG4
	QrAEzp2K3R1inDXR+1+NbZ1LH0ZcjsX0vw2FGjp6ChLQgTl+wdlLBshxJzmiSZf086TdBtorhjD
	ENLTMkF0nb/IHt58cqxQpf3UPA1Os1rMHVj7COxdUbJG0Tt8soZo5GwEGR7tBXc49kD/tV9bdak
	7rvH34330iEwtbOZYKmBK7V5y+RwN5R+C+ZpespFcLq/tOzyORXrHcS3I+y4t9LFV34k8DKpDnK
	sAIkWS87v1VfznJE4jPFcLxI8YjzbYT0EctWilzjA5sDPT0N1ZF2edHxhUfNL5BRO9ANV0u8wl8
	1u5v93ZatUzzJTS/cDbH3IXiYDUydUePZKwURcXidFsJQOV9kktJSSbwICWAIX3XoRp9u6MEbZ+
	YHo4g2nONvxKcYMtZ1XZWsDYcdPdoqo0hBAOSlWr6UEOVA==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr272576205ad.24.1795787131876;
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Fri, 27 Nov 2026 20:45:01 +0700
Message-ID: <20261127134507.125513-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

