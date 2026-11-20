Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175088;
	b=kT6JEwJH4BqhYDy1nb41d7GJXXsSPGBcUJicRBxRJPIQ97frfdolc237l8E4iOQYbTQG
	 QaWA2/ezOuV7xVPyQknp2ewgoq3oi2XJcWyfmf68j7vzSWwZvH19K3xu2wSd9f9ypQXR0
	 j/CG+XDC4lwa751KUJGHThqLlFQdn5XzE45BQgJF1rQkkKPGwsB5fQtdoY20/g9pfcJLM
	 n4Io7hcKuPVEVnvrkIQmdl8gZR/zuL/n2b8hLlaPmk9FTwdRerQ2KrQr9x6whuS9MWeEL
	 Gx7hdVG6fIPfP8efpcjmUeCoEPG5GWcpov7fCrYR4GChZAPNwnACb/trO60r5aRCOMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
	b=b6OvNpBRtoRGdHf8QLSO6+Hz1f5VPGV3QOunWWqURhFoav1Yh1kbVe2VjhyG5oWdhakA
	 04Apnj+uYKvQQIlA4tvguGnWOmV9Hd9MPUdZHcxX3LTfzMBq+a99W5LGZzmvnveayZv8M
	 ezNj0SRKo+Wsq76MKvE8T9ke9nFCHOzwk2+CK6oYgaUjRLzIRdqu8Briiu0w6hi7EqMSe
	 WiS86cTpv8kVNuY/VP98h2z4FLzkcCQVPWyfLw4JulphnzUKkNd8ocQcxtZRWozZTMJsj
	 vcBOmLLR5bAUNkNCkxxWgJgUw3c4S6IG8ykpwBqEK1uDIuLOEBJGmummEODF0Uxud2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VYKf2gRz;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5C60A3820
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D5C60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VYKf2gRz
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so369318a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175088; x=1795779888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
        b=VYKf2gRzQFEWflJPgPiv4oGKQy18k742M+SyPxTjDcV1YzA2HpH+tEith8h3cUYCqS
         ZuHsPGAEFJaEVdHlTn0+7wfNhRpy17x7VUcLO7RcgDKbxaVa8SVFVULOAARCdUgo8MIB
         auec3S/dXTxxBV41FBH7CIdgKi0Pfrtc3PkRXLAM3G3p8FMhi/36apeiTVqxX4b1DT6c
         Z9da1CHxLqdbPb+a/beQVSqOLTW+HbN1Hp3BIYimCZ1zTas5XxTzLR6JZcXyU4+ifSwa
         mDV3bu5Ex5uNRWhErkpkUfWzDPh4/BdFYDj79RFFWOkJPySppnsX4GlX45k1d+ABtV0l
         t5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175088; x=1795779888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
        b=LEO62UuUycM4MZQb2xH1TZxAh7d5SSWtI0jaRX7Gqpi73WPgwzXqEvnVRWWe39mHEc
         RmRMLY4R76mhyiz8BFRH3hOquv0IfxCz8XNfoMJRu+kLErPBSEfoQNZVd/d7gRhon+IN
         bcnT1ICWi4cXvULBUaephwqdEc7Bp2M6nVgkPQsZK/XJmtK7ad2mysVyy2oolw+lJajH
         ucOcCjTk7nLSHuXfW+nrkYNeRacJdVONtlfIohK3TTL7HmAookN3mqbDMSansbupldB6
         svQazStfLu0DjkIkLjan6jJ6k99y1ej0pIoQJhST0Sc6aQzj0s/JtLVThLYz1YSF+NeB
         AlcA==
X-Forwarded-Encrypted: i=1; AL+hErGLMX6GadSCzmKPCw66f6rPQP3lB9/HdvToNpfE9AHAt9UUo7zi8s+8hFc5ucFdNE59W7PgcX7Lg8n9Sag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jweg/vIizbjdKe+ULThhey3ONoadTCEz+60BdjtJlit3cHLjl
	3BZ4DEnuEiv5KyjiFOhoqDmC5hgaZeVmBoluCpjnwHsqk7EjeuhJ0eTeRgd/oYVPVKA=
X-Gm-Gg: AYBFou0AfQ7yR74xIeFZV0+cjjKCAN40gXf6P9Fo+vwh6/aprY6NrAjuirTDbCWiarn
	80MYFvPPlKFauTY1M8AlvJ48aPMj9GCtzK566PFseZHRF66aFO1QjfVpr2xgtcGZJU/nsHFuIMq
	5xNW3iKtvAm3dUmYUVe9lTEV1pj5y9PCQbfWpDNwnt0D4vxIxfAwkgSEiFhgG555Dp4cEVk8ryu
	ALf0VaH2tqyvVUwqqzZVqOPs73qXFbmp+gQJaNGfzxQApOQ7QNIqdSwPSpNMvIn3h6OxQxZGLnW
	lFM+kCpLsfuTXae8XXYmv/82UoFKX8hvgRVASxm4/5yuwz+BleXYjp38L+ZCp6dqVNCLCwEYV4a
	9+m6LegVmo2LQ56AUYSJaoDqCBBus1d1RpHdOhoqje3+3htj8VB0mKK8tlQfypy2FFzQqD586Qd
	kAtmh2ZoluqF42qDPGKQZDjiUcXplMMJeDoCfCRfSU9w/VVKLEfACmM9UxdnS7Hq2FG0Udbtz9c
	R4Wu1HA7CVs7LGRtSU1g4Cdn2gUW+Pgi8xLhfkuykUXhji1p2B4e5QWAmbrN2hIxwJfadk8GboN
	2GsH+2ra4dew2yAqImF3KedCcEb8bWUjnjga0h4jUjoQOQQhn9fSm+Rotf0INIiD6Z/UhVZwBMb
	IgQV45thpmdipCxFMelsnGf3EAUSZTb6cF/uNuNGJ2hqsGRoZQanu4wbk5g==
X-Received: by 2002:a05:6a20:db97:b0:3f8:e0d0:1de3 with SMTP id adf61e73a8af0-4014bc51612mr2765718637.46.1795175087893;
        Fri, 20 Nov 2026 03:44:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm1228138a12.2.2026.11.20.03.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:47 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ram.vegesna@broadcom.com
Cc: dwagner@suse.de,
	mkp@kernel.org,
	jsmart2021@gmail.com,
	hare@suse.de,
	michael.christie@oracle.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: elx: efct: fix target session lifetime against node teardown
Date: Fri, 20 Nov 2026 20:44:42 +0900
Message-ID: <20261120114442.3072652-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
References: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v3:
  https://lore.kernel.org/all/20261021142818.2782104-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
