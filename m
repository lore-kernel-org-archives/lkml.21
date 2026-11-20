Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186892;
	b=mNtmUyDjMyPdKW2untx19dP9+M3Do2sdkzVQluvI9vczoISLcDztlUe8hDjkTaxfRJyJ
	 trfg0CKL7EDxNRi4BPIR9idZ2dEBLnHYyyp1d1GagYvFGsRoeDfMoWfbpK8vOFt25jMXz
	 iTVAOIMF1uyj6Ihn69qztWEcuuAQ7LICc4VhXwKiR2OhczkoJdzn+pTwP/flkzMXIz3m/
	 KxH2Fq74x1hfKnEMe/QECD44+kdowBtgtnM7JBej9evXYFHGA3DqYG0G5uz5lBVvL/z1g
	 IthlTH4MNRpST7jHy5SMwOuhyvwxfdz1vDtwLmDFu1eukIvO6W5gyGFi6tpIr00UKpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrWS7IBw0l6WadgVn6pAwxzws8JpQ7BsYeOxejRCwI8=;
	b=k2UhY9+HqjNHeg1OsMeEUg3VOLvLJ4WG5qtyVBGouowW1ohn3SVXo/3pWQtVex2atbTM
	 5OiwxSHdBY+p3Um82SMcoDcaWUmx7/AOwMiH9fxCalVmjcK0XrNAcSSvTKHruce4FZ7Uc
	 LJsl49jrFAUKS3ZYf2q5XhjFGtRbgaaRAFg6L6IjypIw8W9NGwGOg9ugqEOXpqFk8Xh+v
	 8bhedc5F7Mp6ximfKDmvECARkCmB9oJeVmd6R2e193aUic4N6pZpFXZMpw6x5LtcNCJBe
	 n90z77riiBjeG3gBv8wNtbCnw1L100VBeRn/az5Xfh+i1wXcdV3pk9u3JAU4pGRFtrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qM7lbabL;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF8606A800
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBF8606A800
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qM7lbabL
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso485752a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186892; x=1795791692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrWS7IBw0l6WadgVn6pAwxzws8JpQ7BsYeOxejRCwI8=;
        b=qM7lbabLobt+s8KA34fnit/qF4Wrgk4yasw0UTHe1wjYszmHHw6YhlBKblD9XjZruM
         kGxFeDpSpCuURInCwfoSJHfQjTrBlZHgGn9PpT3y8oTID2k2fuDArkum/lRcvfELeMP9
         KAJ4tfocyyDNM5ZppLSzYVopvaDbfSB8wRAY5p45N/Du/pAWPgGquGxLXHBk0DqOI+m+
         UHHY/OJZM3vaehSpysEoXi60SqlyZVLOUj2lJJ4RjECXLUVrzzJoq/KfHgKg78+BKINk
         7IsH6teynkZFzo8fvjupZ8U09TmB73WvyKdwsuhKjzHeKGL7fWopzyLJrZF8ZGDziQfc
         VnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186892; x=1795791692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWS7IBw0l6WadgVn6pAwxzws8JpQ7BsYeOxejRCwI8=;
        b=0A948JMrtxEHux82PAZUyXqvcjY0QolaMHK0BpEARx7R0opWBv+7RCjTuGitrFD5Kt
         5kclapifglzYajIOg93rva+xe5fdcpSpwGieXYdtDZQQJEhiFBcjALyGO/IVYQ70Fbn+
         9poQnBvt8DK9sDNXn+71Gh+V5JdaJESLSy/VRhjMmVZDKe3KlVf/WiX6ON67iyStQpv1
         cVz3FCr4keMCGIEQSMsSfEObvS1bA7ttVBY11QMrzq5eRKSqciRBvvJBKClzHF2fWg/i
         xvFtDWL6HCZOkLLUmuA8I4RIQHijEZvBsJ0jWYb1ApLeBM9W8v/DOe/f4r4wgrKhw9u0
         OLkg==
X-Forwarded-Encrypted: i=1; AL+hErGyS1wOzkFn/kcC5kJzQYERQld3ceHu1YyqUsU/XZ0jc17SKT5Cca9ghrJb2eDIH5r04q+Q0pje+d7JRyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mSG4eybluHh2P28c89ZHFK+Evaxw3xXVh/uw7R2x0a3CpNUHj
	KSJGmdYKYRtU1PpnWglkjto0raJTYNO4sF3iRS9rxy+vtGVyDAuQ35z356EqrrqAdCE=
X-Gm-Gg: AZFdTZf3c/w9WSiT0myvcC+fOZ5BWLwySwS4YBsIbc/PFbv1wvgebjI3em5wwbNF+ER
	cz0MKVQCM4QyYazb69X7Z0d875cj91p7NYQOQ9nHTs/4Kfe+Lo89qvPhkVZ0plULqK2V4KNSnlP
	Sx+LeBq3KP8QJnl9NIY3ei2YxJgM0W3BchsVy3exA16QxKOgd1g5HW5G7EKHXTlZDNReqCRray9
	ByoqdWRl6+h/WeYpoNFMHyhKwiWp7X2Uxf+tiqcw2yd0GH2wb0PIEA2J0qc1N5EPqx4kI0XwAL+
	jeQZMi9kE7Z2jJkSoS2iFsrpLWGbNUzyxkwqCnQrs6lH0oimOphEvHbSw7LS2B//U58iP0ItrHF
	jXp5hqx9o4N+fwyTtNCmcmJ0/L64zI45nqMD4FlySy4FYGIAR9uWTMqFJtoljKSZDS8/QDXDnPI
	/OtIis7q2e9CYBY8fASxs5RIJDAUJB1/W+Qq6dmoR9nHGft2E5OM0EYuhrnQkLBvbwj6zZ9LBtJ
	xijysnWZDQfBGI9lNwb/7boOnO3YPyYV4X3SurR3GKo2ccrWh3hl3ee0pBj2lctnhYhD3v8/iP0
	9Q0DpiFUCCk2o/SXJgA8eMyieHHnWMwvvvx07EHu4cAyvKZxiYX6hZ13oa0n41GTGmnmMqt3/5S
	Jcc/PraJn7zogQYXlpeeJ3TS7bH33rpWbPy0v3e410tP2lBD1E0G9XmvNnCI=
X-Received: by 2002:a17:90b:3cc7:b0:3b3:c6b1:2277 with SMTP id 98e67ed59e1d1-3b41c93cdc8mr2237808a91.32.1795186891769;
        Fri, 20 Nov 2026 07:01:31 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm4680914a91.8.2026.11.20.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:31 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: philipp.reisner@linbit.com
Cc: lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	axboe@kernel.dk,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drbd: reject an out-of-range offset when decoding a compressed bitmap
Date: Sat, 21 Nov 2026 00:01:26 +0900
Message-ID: <20261120150126.3128366-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
References: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 06, 2026 at 12:57:13PM +0900, Yehyeong Lee wrote:
> recv_bm_rle_bits() decodes a run-length-encoded bitmap from the peer and
> accumulates the bit position s across the runs.  The upper bound
> (e >= c->bm_bits) is only checked in the branch taken for a set-bits
> (toggle) run, so a clear run advances s with no check at all.  A peer can
> make s run past the bitmap with a single run; it is stored in
> c->bit_offset unvalidated, recv_bm_rle_bits() returns "not done"

This is superseded by v2:
  https://lore.kernel.org/all/20261006141509.521128-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
