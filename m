Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729487;
	b=KIL1gYsWv5tqOk9cSX3r3RR0vdHhsis1w7DOn2cBAVz0/UY31DNewzCypeF3dLafbDf0
	 v/X/3x63UkVPASXdDHnYLsJaRI0GPO4RE4n8J0NpKtwK2Z6QyJLPKb/bFh/GlO6yfiNgK
	 vRwyd6imd4hMGiVd4yo4VBRp61G7CvKJOf9gSGi7Zh+xihQO1yB/4+09tfk5XLblYAU6l
	 822bkqfwRVA369Wk7n2/WQE7n67+jE/fdUY9xrcRU8SC+32RZyyJVsW3PfGXtvElNMo0z
	 3quGQ+r/QjBNUa+jqRDs1CUzedmylzS7jQF8gcJMtTgWuFjSs0e13zjajEVKqd7iaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
	b=kNuqQ0VMyUUxlPGI4oPLDgBp/OdmlMGnHIyj3kOKz6EnE26FOEfAz9FcTSPJOxWdbhLN
	 X3YAYri8cSlGTANGBsKOgd1/b+KsZKNug5qioMEuPM0uVx4aDbOhSLoPotLAs8X3/3CIE
	 kzLi9F/Wzki8MnhJ/YW8VwAAtQPzgtFIIgoZgv/0hMxVIRJv0S1nbJ5juzLXhlwuw4n3Z
	 505ImeNSO6QPSAE/zq1Z3xKlEsbZpZntvtnn79KpKC8CGv6B+xJtm445/wvm5TDCP94RD
	 9k4JCcHH0ALGz4bQymBdFDrHWR/y8rTN3gnmXuNmfRZdGxeDeQb8xdeGPIOe2zxaHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2fnCsf1;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158B606A6B2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0158B606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2fnCsf1
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so4275667f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729485; x=1796334285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=z2fnCsf1MrGS8du7uy74STXVZgP+RCUZ9Bg7j2mvA2sELRaOxBn3KwT4NACo4GD+1J
         8fBSwYBYTUfOAo6OcF9e6yDpZ0oIYegmk4r7+PzeTsSSRHQowcYXQ50ECbpTLpKFk7pe
         mAfunw9gJQUu5sVEig0wjOz+GkYTyf1EZdxS2oOVcF3WhnjwIjfK646ON/beuo4s5b6R
         Lzo4Cg+VBDfKVXdaB2LqLfck+TA8/kjbz/XH1/7prvda2A11GJH+q9QQ3rnECEDBu0Dv
         TMkr4IqNWa413wKd8Ct+qu73RQ4RODT+9hByV+JForhDr+wZEfmxT3zxFBcHL6+NR/Iw
         OQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729485; x=1796334285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=UivlULc2ausBn5EeJCHpMRy4swkp0ps4fgS+UQbb1NL0CjiT/b2pj6gTuQ6WkrWScb
         v+1WJ9/rqlbkZehAKLdFdFrQLJq25dXFFwRhF3sm16k+ZrumD2+aJfdSnkdIdfSg8D8s
         gAFu49ee+O6SrVQejAx9YXF7WpRX+av0d7o1MyHY5djqChNJbsz1dIdhGJSbVFAus6BY
         girCE/PcZ5Y+g+1hDFpdwYSl9SuQ6BQgdr9rtVEL7R3yxpQ7UyJY6BTqbuxlWH71GEnT
         2KuGjnwpOl1kStl6JVoGanLyT1cAHlKxqp95c/bPZ5yBN/DdC4JpDjm0gRCpRaYgRw6o
         iA2g==
X-Forwarded-Encrypted: i=1; AL+hErG+dMEszIfRJTjPAux0WGuwZDt7A1T1ImLLy/ixWpJRgQAhKY8387SSJHMqK0yP8r3f06HFzuCpacmox9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SSjX8WrwlOwv5EUogu8/aUrJeAr/yLMp4hEkhZFShcd9eShCd
	oIjlrAzVDuTSJR2IHqTz/Cezw+NqI1Fz+QDmUsFY0ADL/IbVcU0typZ9
X-Gm-Gg: AZFdTZcqopFjG/7vqa54NeuOn8pNqy5l37mBQUViG9ph3ZA3/HvEc+fbgX7QXn3utoK
	UoccMwZg/bm7kI6iLuEWjr9+EpS3eoKyQy5oHXqoSQ1bR6iKViN0Egx8vnr7nlNaB43Wo6ZGn+M
	j+Oc6ctB3pAtPSdEo4buvDN/iEt/FtaUrsXddbWDODWGhw7kPB9v5Jc3lSSlXL87F+i5D/wLuGr
	PjXg5UriPXyMkmck9b7TJ1QUfl7YhDKfzKoTe9D5LJ+9STwXlj573GCa4jHpdJtcNCPGNC0tt1J
	OpDplRV0OnvXlaNk7LqaLV0yBcIQLdvrqJW4eha9pnlt9r9+3FehIf6JKf4ajdn+MsauVAmvgdU
	NWy7NW4rFIME3UTqYNdwFeJ2fzmFi77R3Ad0XU38Rtgh2BmavTM7sm++kXj0cfVwZ/j7sxHfGrH
	+39YZqPomTCgVyiSCWgeaqcXZBVK4OSZzJwhumWj+kGAah2iIcu17GR3kV3NQn5y/SuSyQpMUG5
	nD2Ii6yL+slrhRxHRr8PeWRt6L/+nxZPrAD1AIKDiVfM5na0wZZDO4j7GgJFHtSXM4eN4PAoJcq
	KOXfIHkxSZpTgKrc3GfqjqvSG0IQCe2hhW3y9BwbMAEOnmcjDWM+BERmIRQySZkBdBrlrIzmqyk
	ePUf7CtPTy7xQROjxuB7HTzUU3yhWVaeS+ty9vg5v8rQLGRM3/bmFrxmTYVbiR/JDy9qFISbGIs
	9JQXLQFe0QAbz5USmA7Ryx6/7cX1tkcEb3ejDFcV+Bymlx7UMZ3JYcIgZr+kFMszVzQHhYYEeJJ
	vIB2lPLHpUGojNAtL1uP3MM4TFnPA2x3t7Z8ubFSw==
X-Received: by 2002:a05:6000:2b8e:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4abb55185b5mr27115538f8f.49.1795729485342;
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] drm/sun4i: tcon: Request LVDS reset as shared
Date: Thu, 26 Nov 2026 22:44:26 +0100
Message-ID: <20261126214433.3562326-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616, and other SoCs with the same die like T507, have one LVDS reset
line for both TCON LCDs. The TCON driver requests it exclusively, so the
second TCON LCD fails to get it with -EBUSY and the display pipeline
doesn't come up when both TCON LCDs are enabled.

Request the LVDS reset as shared. The driver only pulses it once in bind
with reset_control_reset(), which is fine for shared resets, since the
reset core triggers it only once.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 20740fa10ce8..77b6026bc895 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1170,8 +1170,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		 *
 		 * If the property is missing, just disable LVDS, and
 		 * print a warning.
+		 *
+		 * The reset is shared, since some SoCs have one LVDS reset
+		 * line for multiple TCONs.
 		 */
-		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+		tcon->lvds_rst = devm_reset_control_get_optional_shared(dev, "lvds");
 		if (IS_ERR(tcon->lvds_rst)) {
 			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(tcon->lvds_rst);
-- 
2.43.0

