Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645564;
	b=oEtTc1nWLIXzpDNgtq90J2mlLbrY+w3tjNF2uIt6XH3Io8lbzKKoWLBg9aTxpIz9Q+kg
	 gRFaTD5MbXw+NA+JJUWShv5/LnmeAiL2c6atqTEf1cHFwz5q161JjV/TW0rikAXKXb2qw
	 kvSBUR9jFpVnIs23ot6jJrpUtjTF+ri1uIYpnGF9TtnO8pxueDld9wgzj6l97TvUjNdGO
	 2HezwYwIe6BYDvRWBCYZu6Gk76owT69/FrdsG12ZpYydz+Pxk1c0EZl/+Emoh97DJm7M7
	 H8eSbp5iixclrNbZ3KVQEyI3OYTXODnB9f9X4iKyjpsBddh2GlOSasY9idnQ6GYkFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
	b=HTfWtvsuNOm8pPHy0DpeUR2o8vK21jXn/OXWoADnwEVeqEAgcmsywG0V2eco2l4vwKK4
	 jymmMSIxC+BO7nJl34btkR+RcAhLP8pe2IAItNCgBNcQaLpWS0RwfpTn2yIm9CL/eBkZX
	 jOU76VgXkZ/hlp0PgIg2wbcHUYIbT24aLdrFwSLnCIV/+K9F0asIKfH7bd5ukx4toRTWz
	 s0t7G3os4IRnA0mkt4lHOpg7LAlLPCsvhayi/X7OC4Rwm+bXHz14Xp6H+9xvO5uoamhM+
	 YFjJdkqKv219uNm7Kr2Y4nsLisbROqLP6eSygLDWOgCo8Bw63X6muvyJo6/RHmeD3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F70606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F70606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6653042eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645563; x=1796250363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=WYr8UlZQqejsMUyRWfaFcmN8i6GPXdsjEbdVmmsQh0XcQbpE2IfUnuGMBAnov35+EW
         yAGEQtWVJBG0nHdmMno1WYKwWuw7WlPtazYMS58wpc8/aHCYTOS8SlNZ0xCNhGBKmWU8
         aE/JmvBXNQflHgDIwCrEJSFm4N3ykPSWjWch9MIxtAa1PtNnsNBUrS5b5F0X4xX5R5Lo
         a72uSwULhvstznQ4QKHnoP8LdbU80aWdkfQjF5O+uh5bsdPvpuZU5CR8alQbrHtc7dHy
         n/Ii5+XLTBO5qv2hZdOfTlRAfsTCvuulCQRvonZRQb4NxxFsUVGfzUzxEtFRN0FlkEaL
         T70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645563; x=1796250363;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=o9srHD4+C511jA5dRXd3oRCGGpG2nCWAfvoMq02XsaZOzGqhR3lo8A9Wm3fad9Y1W1
         kxf3w5Ur6jDqIvxZCIAdNq16vmOr10t8RkUhFMt7nR8T0cGui7CW3qzGDzhEVIBk/0TT
         3QHHHIwoXClAmQVeznfPRg76vwbKarSOtj0WT8kkZtcKo6Pf4lMSbhoZW6zamRNBrdb0
         uOq0FzS4UafPls5uUXSEvXeKF1Rt8MOPqKvBlwg3hqESCerzaM6dYIXpH1A3PXXrClqq
         NB8BPX7+WwEdWjpr+hnOiVPBoNNKVRzK1HnQkQmHUtCsDtR3n9FyNXANe6vhIdy44U2Z
         aJlA==
X-Forwarded-Encrypted: i=1; AL+hErEd2Ap6TnZ0UQlH3sATARC2uV+zQxAXp0qGOcFdP0QrMbJPdOY7gzngdnmWC26yicfhqmAiWcVSZHSLBM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uIAGQiNzNwWd4hSDZOJ4WvzFXRZ7/wgTf/ciPijIeaRLLXiLC
	Eo3P5Yj0YgCEcgZkKNLPNyQLmyooO+H3568wYbLSOhEm5aBjfhKvsi1BdjzgAd7qFwNhWxwuQfi
	NZw==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:1b5:58b9:e078])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a83:b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b55693aaabmr25999920c88.38.1795645563065; Wed, 25
 Nov 2026 14:26:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222549.1447825-1-elkin@google.com>
Subject: [PATCH 0/2] pinctrl: tegra: fix Tegra186 AON bank index and add bank
 bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  pinctrl: tegra186: Fix register bank for AON drive pin groups
  pinctrl: tegra: Add register bank bounds checks

 drivers/pinctrl/tegra/pinctrl-tegra.c    |   8 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c | 102 +++++++++++------------
 2 files changed, 58 insertions(+), 52 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

