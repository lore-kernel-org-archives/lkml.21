Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217027;
	b=Yl10bbM94/6YhxGxDcbTf5K7CzK4CzUjpHcoyC5bkcJFxTIG2FoXuda6XjJV5x4ibujN
	 fdxGF09DK3x7A4XblVnqhXA6M5P3JvwZfZbPQ6eqGy1kCHGAcrg+bjh3ke4xPr+ptxylG
	 nRvVGhS/mlq4GAmTEFlp2/ZqkwwZaCQnT/4aVKHkaNac23vPgGedCV4ungrNPCg69vs+a
	 7TSqDDqOMpwHewllcjncSJuvfl9imZUEgmO4Pkv0YeNvu62Am6ttSNLFTdhOOSR0+IHJk
	 RS/seIEZVGKHB3KbTpZ1KnCEPO22r4RJifyC7J5UQbALrNFFh9bq1KK1oSWtsC3XJ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217027;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TGWLnIfO8Lat7Y9NAAZx//6gPQdAxKgN9VEcDXQpR2g=;
	b=IxcDP0C//cAPWcgXS7JA2y9ixEYyNQlORlcOF+wNQLs12O8Y+iknzn/QMzNMfF9G9YXx
	 ekqBAWtUD6N7CCX509IO6oSzGJaa8I8cXyVkhcGXN6kPRKU9fKbX6xx+kGhiB8IREo0ii
	 J9eG83+zhT/gAeFtsPtD+f7KRDrzyn3yByjaF8kVovCLzTM3Ud4VzvStwaiRO7fDgdq80
	 UJ0vRLyn8kon1EceFyzNDTJ6RY8HzdfKTO2YvaaM+j1qnDzfuBekw2IkXTz8iJIyG0oRQ
	 YYyHayCyZHOOLTGHX8et6ON+9COiVrDH0NpDfJ+KqHz1f96R3gSUynxOP7OlUA5wGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4ED606A683
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4ED606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5495d549924so15472631cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217026; x=1795821826;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGWLnIfO8Lat7Y9NAAZx//6gPQdAxKgN9VEcDXQpR2g=;
        b=t4zX9nyS2hfJr6g3/DPvQ3+Jv6x5mefmusK4Na2vTAhBG9k/HtYmUo90Wb5D1Gmeth
         u3VMRter2QLynQMLH5I9qTzYNZTRR2Y36qVAoJfh+7zqVez/KBlGppWvhubiQjm6QLA5
         ItPrR6X3nD1kHUHb8llAuwOX9TLDrmBiuEInv7LdITTSOI0kIxEktH/5h202nVMMBYfd
         INoPogbBZweFFgabTj1B2JKMCJHQT5EUXvvJ2C2DJVG/pq+VdRswlSlXhkUQI+3+kumQ
         WSYJuk+Ofv1uT+Y8CBLwUZIidAVLRdCOcfYs//CC/iuKV/kcdCmC8R2E2Rur6RSVrrCW
         jSig==
X-Forwarded-Encrypted: i=1; AL+hErGaMzD4aagPZuR1b1hQlsayNrtP8MsSNo5txJpWTlA86kWuyBQY9PTkAVrnCwox22EbiM4KehDALi+NTFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9405DYSP/7XhTdzwKvAQxBj8YdqepXtoDaCyouHyRGinQYwQi6
	faUMvrY6Yh+sxrNiel8ayg54smQ6GUdl9w3Pu9atqkfT/z7KHGKx56ze
X-Gm-Gg: AYBFou139SZy0/u5Due2YjBrFBOaJHngwE6ozBgi5d4wUwyBpZcRJjBGLHxewc4phfR
	4c4Zf2KpPl97d0w+oI7+Fu0n3D4KEbOOQqR1e3BKaurXpSX791QbfQIZ7a7x+B8vi5uYFRTypST
	266Vqz+D9gZODl/j0aliPrJTGdIQ4/OArDtH/sxLCp/OAn/k4abkDg9SyDGOnrRDTd63cWyRaKS
	H1YfkyosIY/dxiV89RC/Tg62IbfJe5QVzXvljiQqepelqKrn8v4/hnr7uGqi3PMIVkAl/BTG5k6
	bFUpYbvUe816d5F9HAaW/vXlXlivSmAn1b29g3xAyYTDMZoJwTmRZH+EY13EY74l8i7fmBkT8Vh
	r/TOzsy4fi7hPYADmBjSctmTF9yU7ODJVVna22/23xAFvjWDqoDs1wcrVznVTgWAMT+nbeG3Ass
	mBdx/FnZVtrCAzFTYDfpCaCwoBDJUh3vnKeb45Oj0FurlP3/PpuMkEU4XYOEPrD5rCe1wM/Czdi
	iDOOEZV/gJ2DCFtFb/rEwIE2bc5I5TSdY4KSOu1QNX7Xk0FuIxcVl0Auvawg8jECHk8nhfMolww
	LpMgYZDroHgbv4AeiiVogHLhCEceNW4hzL8s69iggPLQNlNX7sxygSi+DQYKkoxLthaHFRrPCKf
	jndBZpiPpU4cBLf5jgkzd/YjBlQ+d2lM9Hsj6yJD7wdXh+mlOujIg
X-Received: by 2002:a05:620a:458d:b0:949:73bc:c763 with SMTP id af79cd13be357-949baa13d87mr880796285a.58.1795217026434;
        Fri, 20 Nov 2026 15:23:46 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm303706185a.37.2026.11.20.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:45 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 2/8] libbpf: ringbuf: Use compiler atomics
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430208.33161.11588030194941155653@kernel.org>
In-Reply-To: <8676fc63d1b69002f39adee94811f9384c19bb8f6e89d08576e5aaab283c6aa2@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-2-ff7ca15d6c37@kernel.org> <8676fc63d1b69002f39adee94811f9384c19bb8f6e89d08576e5aaab283c6aa2@mail.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Could the fence patch come first, or could this patch carry the fence?

Combined in v4, with the arm64 RCpc ordering dependency
explained in the commit message.
