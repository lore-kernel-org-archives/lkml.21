Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403688;
	b=ZE6/kldoWCBgRFJ1FRlZBBDIdK6eOReA/rWHcU18nQsm15KW+JDRRrqsZg+T1JMLZ3qb
	 x5nOrxKaVNB1cVZefzxHIPrSeFazEypzbQYBmHqnRsgNoxrUJHCYFZAxKvJeuQYF5LT9c
	 6iiuAat31g8GT287unHdwSgUnd63K5EY6EqmX8hNePgBfp6HSgtKVFGIrNmmp2gcOQ0Sp
	 FFZ5F5DM1MV+0T99bCS5ZWjCUxT4fQL53o2HqxDQPlk9qc8os6oWxPEKYM8eUHNiaSo3i
	 aXPjKUrxyhCgTjfh0DIjm/BpWsi7EZb91ce4zpuYms2ZIVbPGS4zBK0EK4WgBzLC8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WmgsHFkL+h5rhuDAcwccXtAUWFqNQ8ooJCVW/O2Ov/8=;
	b=muuiRDyzXKdjQVtMR1KWs27ZfKbthz4wwhoShg46+Z8GM/BCITJZZRlLyPMjA/wQuOXB
	 5QL80AJ+6y0gUHP6J/HR8DrQYIvVUp7XhawXq7j9lRDHEmHi1AIl/YDH5irjVleG503SH
	 o8i56mY924t0JMHvDjdkeXOlh1Z3nJ+Flq23ZvaM8z1ZADPILr3M8AiJLJSA6fLXJXZ+v
	 AQhD+OtwIjpfFCT9PZfZXChjQ9MOMHRoUm/c9HNXqGaayPd4ximcYrFbKEdJ2k/HALnNu
	 NhHMUbaNZbagYY2X1kkuqfxQMcqYJY3EQl6PhrWA7WYmO5EKB9TAeJlXoGJkPGrA4dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WnOdVWyh;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D88606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WnOdVWyh
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1268669a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795403687; x=1796008487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmgsHFkL+h5rhuDAcwccXtAUWFqNQ8ooJCVW/O2Ov/8=;
        b=WnOdVWyhp1gkrfxHlEH2PWk6G9rSeBv/1eaEH1icWinqo2eKIbt3k0B0RAy2laNiyi
         h/WJEVTljgFwB7AWcEDVl1eb7BulHCnbBlw/QJjV4nW18uOPOpAz6Zcb6u1J002+staA
         2tldpYvcKVYtztHhnZQYO6iNSYVkPf+sTDiCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403687; x=1796008487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmgsHFkL+h5rhuDAcwccXtAUWFqNQ8ooJCVW/O2Ov/8=;
        b=xmm65t2DHGNum6x4qmkmLDUif36fMZzuL1Ab3Jsoij8Qg2BXt7Lf5G5pvyP09FRPok
         yZdAPvnunNcb2u/5uMFww+t/EjlsDcxPothugRyPIKr6RzovCh30L84POfDiDIUG3V2r
         70CC5Rz/IR0tiNxtYJ/ZwYaRIyArIWKhw4vV3JFBPCkOocrDqSQJSjnyTm6sIGNTRNfj
         OiMEG3BPTxB9OSlBF1CJ3U/F4UX//YHcczBoK4yuZ7IetJC+EGEADe1nwFI5R4hYT8s+
         Ra7p6Yp9JjJVwpR7fplCoJXYCSbVORjdamtkLl9DoewWISgaVpn4E/KX+8W3nyodK6Hs
         WoJQ==
X-Forwarded-Encrypted: i=1; AL+hErH5mkzwgdYXUA+l6neHAU2deCIHCxxClikkanL6QPLNGmLdLOFtMoBedp5zaeSB4QakzFgsH8tyAr/NOkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4u3B7EW77rhZkHHhv4eBEBXqlMIT4lJw8GV0m1m/COkfsLDdl
	fGgJ7FJ1p4n8qF2OPUanYpWFTCIndvlVDOaA9mXJ/oM1ckJEH6LCX5asNbwnZu8Ptg==
X-Gm-Gg: AZFdTZcIAHEa5z3JV8FgueOKgeNbj9oa8vY22TV1ghxeCu8/itkDC4BbFfpP3eKVFDv
	hCIEz7JsTcii2wSPdP9lmoYvHj+Qeq3XJQ02T1kqAhXSBtX323mR+A5ZNbOdoISCf+ze8Gf+S5f
	O+4hEz8Q9W2uE9bEhy0SOZK+IJoeL7KQnGdSSBfMGyqCdmblSTdqYhj5/GqIIMSgNWn3bIAhiU4
	9WrMAU+8h2aifz7KhbL286EyROdMt8bWzHetT+ugDmYyuVM1HtYADKh3sRmDeRiPQiUa4XhXM0a
	Wpm49OkrSp/nW09eaDH9cl1/525Cm1ZY5045T9jlKze/x2BJIU7JzCUpETdj8UiuMIO1dl8JqGs
	Zg4H/feygoQy0KPhm4ZvozrEuCeBG2F7G4YCAXenRBQXziHKU4iC0BirAA1ygQQNBw1hq6XL4td
	IZmGvWWrUe8SbmT46UNnRn7JZXOrx/vN6myKYOLc6ZinZgZADzxYDet/AzVWB28bcQiOVLWcuct
	Sul53b0AMPpuG9Vw0rZGF6CZ9kcNeSHGEaCbkZ9LykUMzOY+tH01hl2fJfQSiJAHxy12F6s79rB
	pYflsVVp59yBYRjRWz75Dy6lydnzYqCifEraAg1iZalNlaCrrSqVBYtSRw3rCEXQJWYDFA==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr9034938a91.17.1795403687341;
        Sun, 22 Nov 2026 19:14:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm16010576a91.1.2026.11.22.19.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:14:46 -0800 (PST)
Date: Mon, 23 Nov 2026 12:14:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] zsmalloc: free a zspage's pages in one batch
Message-ID: <awOvXnBW_QWGigkX@google.com>
References: <5666c1c8c04998784c81fc8fe751e35aa40af578.1795403342.git.senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5666c1c8c04998784c81fc8fe751e35aa40af578.1795403342.git.senozhatsky@chromium.org>

On (26/11/23 12:10), Sergey Senozhatsky wrote:
> [...]  The batch lives in its own noinline
> function, which also keeps.

Oh, the "which also keeps" part is a lefover from a previous version of the
patch.
