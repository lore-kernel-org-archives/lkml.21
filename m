Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186842;
	b=pRL4ZXODdwf22X4ETw4UFnAFzyp3QKQ94WlMTVvLWjNbJ2zzRqCbsx8Ae0H6On+IMyGy
	 gWfuIlQFP58z3BU3leazPtmE2hCvaLrDRMUP0cUs3hkCwpIIqoSA0ScoqyKm01oohDnJ1
	 0DX4Z39iFb4CZcDtPwYQZP/3dVwqimlK/xnX9YCCss958DTDRuCzoV5aT5dZMiSHf0E6Q
	 P/v7l82MkRI61SXiAJtZo+EGqleBfd7D2Yn8ZaxaHGYHkr6FihlJSs6LRfzCYz7wOAn6e
	 7/zCmEyX25BpYtEKNt7L9KEp31iozJ9pxnoBUI3TO6iuBncjwM5RRb3LYX8xA3ZDj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9M/YOMO9x/my0Rdh0CURVZWkEgZqlwEDWAQhtV+rWS0=;
	b=2ouTUMkgT974jSUWHqe8ROUzGpKNZV4ZccqYWk9lzxOoaKWIP6xCEjPy7ne4t6JrHjD1
	 lsH5dpvcQ12FhYtG6ynAmnG+bLPpQGmGtF78dybKZ4vwiAyb//zlObuCuRYpk5RLiLdPJ
	 6lpNth2Fg+c5yULWIxNvmbJ60fnxov/4NYYXqeZl5Vff7Towb9YV+mahJIUq4B5gG1t0C
	 BSJhkRRXXQehcQHSsgfmYoBZ78efUR/ybtD6XfpBdwNqDkxg4ty/EUxL+lhafSeIvyXTY
	 ns1QlHZHCYowCJXZW43Jw5Jcl5jTgAK27HSQ7PdReHwpp3fzG1d4TuLllMceX1qeEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hwExBKKe;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43706074D20
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43706074D20
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hwExBKKe
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd69954c755so753204a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186841; x=1795791641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9M/YOMO9x/my0Rdh0CURVZWkEgZqlwEDWAQhtV+rWS0=;
        b=hwExBKKeDFUNolH3tey9lJmOhxRe9lP/LXNVo6v42Ou1ZYWgB0zSp4fYp+UwlT2q8R
         4g3yhemjCcccHdq0S4RhM0fZR2nLIWO+RSms+pEKTFJf45ZZIC6KkSSsUYlQTeysSq+y
         qWuP16+lcqV70heJVOkjzf5lI41MrJSlxN7X6qc28iNvpRgT+wKyDsJhDMF6GSN0RgaO
         meLkSDSupuh2EXBWw375NS831TDDsZBUn0DIRJOCI2z6MrnIEo9yttPxZ783OHB7WjIy
         jAvxGQj3eszobMEylS3beANdZBl11N5GxY0zqmHT0jKI6D6HuKaS+WyxBbZ7+KswQWTb
         RUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186841; x=1795791641;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9M/YOMO9x/my0Rdh0CURVZWkEgZqlwEDWAQhtV+rWS0=;
        b=JRcZJ9qSox/lXkjA7LvM/fYW+yeAUVJe+V9B9/ai84+ZlmtCE1uKzAUipnevpibsaQ
         ODk8buIAIDd11Y67S14v3sxSQdE246l211qykjm+Z0ugPg27ywoBNn4xHwi5pGULKEnO
         a8VIFWmwKuIaGUtM26DHcfi852hv5QEdUIaHonSznTdVMNrGZb9esEeF6lTDn5jnmnEd
         2XScL4m9hFfL/DWhT+XAYtLbXPM3HBT7Xd+x5Z7PXwMYtQEZyDJDhYZ7jmibSN8e9FYN
         BD5lCixVHRcL8VmgCY+m784IJTKJXS0U+w93IIZl4xTdklOM0ScO5aD96IdabyLMkj+u
         7wdQ==
X-Forwarded-Encrypted: i=1; AL+hErGUHx7CAXVPmV3le+QR/bwfnD3wFy3pWKcxq7Vopcj9PiGrNdFd+9yEMrXukJ/mFD+BWJIKSTK+s3F8Sn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7EQWdGw766r2Nq8hr42Z1XNwQguK5viqdpgA3EwzlRkd6GCoL
	rS2QBeXPBIIdMmrqu8w0wC9w5RoOnGWx51HT7RsmgsmmfiHPm06TtpnEgzNtFF1CBBhU2irRQvq
	Ih96pqMg=
X-Gm-Gg: AZFdTZeehYAeSU35vCJbDoxObQNSKQYP7d32K1K4gKjIXCd6HTLIE1BgZU5NwGEZoux
	NPidDYEeMkLtUjxdcWE0rmZpJW2kOz6EfwpH8e+7uqrbrCq8RLbBBMTuweHw03ELUsk8Aa2ehGT
	PdD8c7GfjxS8h+FPxlFmWHsrbKKR+hgGbII5FZYsmwPxzA+d8AHUtRVQyw7YmPB8SVvFZoSC/6G
	Y92FkiT831Z3ORjpKJB0B9fRlnu5xBa+Hd59k5HSyzi7bTjko72r+8/aXrrSqCI1zhRUxCUqK80
	iV3SWR5TUcO4rzOw7p1Zyk/GRRsGR4DpK/0rEf+VHTt2pg4F2soqb6Q0aRk7pGmuTMa8bjx+xQQ
	2tAvKwYmAE3rOb9G4kskRG5lyVMK9Hkt2ZRAjPimnlilAsXNACcDIg6+a5Jzr1ZePF8E40zoWO2
	N+lfQgjKl3BG47EmFte/eNYz/5Ww8CDjCMEHaiWJE3YFVIvdakYlrBpMPYx6b/risGN0it7TtvU
	S/Z0UXMaAvmrYddJQonUjDk/Dc4HO3vRYIWnpmcFyOvMFLxk0iPh/7MYANEl1iVQ8VXnLN3RLjq
	OAZa4PXmeUGkhVwx8WU3okNe729DHa9p2rti3Oim5WBYA+24ASgQhJNe4SpQznzFyzTNcfP8yCH
	tYxg4/UHRNRh+23q4iS7AJ0d8TNqzrd2uEIBi
X-Received: by 2002:a17:90b:3b52:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3b41c9e4b34mr3219603a91.33.1795186840711;
        Fri, 20 Nov 2026 07:00:40 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4652189a91.15.2026.11.20.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:40 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] scsi: mvumi: bound the values the firmware supplies
Date: Sat, 21 Nov 2026 00:00:36 +0900
Message-ID: <20261120150036.3128205-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Oct 15, 2026 at 11:27:20AM +0900, Yehyeong Lee wrote:
> This supersedes

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
