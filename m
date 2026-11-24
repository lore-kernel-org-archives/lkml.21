Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549437;
	b=q5+5H4d+Ou394HQhJktaC26ZHI2MjsuXsP438l7rmgiLK4Qr7t5qLAhrWoR+CVHC4flk
	 OqWBcUQlylYJOWNrOfIShZuZTfOHM9BVA0wqRF6M/qs8N9U6nKvgvXgznqnLhb6zznr6d
	 AQxsiQ8aSGFZBv72bT76/bTgTwnkGzphM9GP30rDVfWcH9aGC72OSSvgADmX9sMGLYpy3
	 2jTXI34wJAhqU5fo7YbiMs5bwmvOF0UuZipMbc1xW8JIS/7G6V5K7s6QbzIVueZPdljnU
	 SzkNjLePkeX3Rz4UpOddfJjxfVZZ56s5AvAEec2Y/QZPRQoEWqe4SN/B5yBXStAzBcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
	b=fBWA1Qa395AJsfWv/u8e7pQIYGYY0G6UCKejnLbaCxm6sI1BXyxGTpxVOa3ZwZY49tCn
	 NVjBAGUq8JDyxhEVXXyzO0a1qiLm0J9+xdvy35QAsb47+tOWk1bUR5mwJVI+0oNRv3dgx
	 eZ0awwHU/D8o11Cq/nrh/THH+nUcdAFbnTBQ2aBm/v8ElsKicmvDsa1LNEf71D8tfN9i5
	 mplZs9v2GHplaRuEb9XZJNLXFOrCKp14f1dWjjqtTdW5XsECjqn5DsXopeMf0oTZmDQ0G
	 FRQro0gdXWz4r9Jpt1xFmiTRgvX04xV6JFuu2WBLQvB+8rQIYPH0BDmLNmfjdEch6Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso6358729a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549436; cv=none;
        d=google.com; s=arc-20260327;
        b=syyK+X/+10lBeCg2wuMVgWq0bwbGBk2xkjB5fP2DrWWrgpSpeR0y3J0bDbLhJL0j9L
         a5l2QEHzUZZiDWYHDpTidsnn/DHrS8G1KdWYMZd7qQ1IZzuIMnC6AImOgQ89zFq48d30
         pFPmpx8t3rZItG3bgQ4nyZfWvCA7MZ1pLHUzCmfU+ZKQ+wZPFIJa/eot4d7v1WU3qh6N
         QpjyNSxtlZypzR5k1eGhMG6iYihs/1lQzA0D9YiaUYb57frgVCeDE3VMsuuJkZVYtmVK
         3PJz49TPkFp4GngUL7ZeKglr4Z9Jh2N11sPy2vliYNxJPmRVP+sgADyOWhMt2RhFoOWH
         1DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        fh=v4rpN9ztCGtpIqvoW5H4fiLehTXNawVSSW++y5zDOvE=;
        b=YEkpy0H4EwkmlNzXg/tqz+x8G0ItgGkt34KuBIBAxlPmCVpRNFOi01E8LOtfZtFd/c
         hwGL5bVfs1JbBr3DV9DuWceuTmI6BxyROBM3yU07tPoGZv1AgyZMMB0ft5Fk5ApHlk7A
         qoGZhaEJe6IKohIn5kGU8nmdgYfMjKfCw7M3Qe6pY/dzGYr6e28zg9oIZ5ohDtO9kpbD
         sAZ0r9Ou9dDh6dXHae2xX5mfBNN0yJ1kmjb3wKV7P+aUJASPxhHlnzQILAom7CPqOWli
         jFkDG1RBugisssDgH5gakNfAAdZYN1BMpMSwWaAICBSa1KTg5AZ4SSqXPs6hGBHeNWEb
         u2rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549436; x=1796154236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=XAGtHY+4xaUrnSj0AmUfbCZQv/JYYTKVznKj7XFa4ESf2ICNPobilYb1TiLfWjBzic
         xufpRUBUzROsFWPm1J8YSzfA/34w/PyALXgPwV2xyrHyXKn2Os4KGwHd3BBzDW/HYrJU
         JHNDyYjuAJr4adyDNx+VA4EH6BZDkhK88jRggaNv1jjEzdJOVr6NO3s5J7lkcWO6sA3R
         CSaoRHmXrDpN7c3+Z3KfuGbTF8Ni0E0XJFeWe03pnyNvIpZuu8kb/xvbRWtmPxyJYGj5
         0MSqUIEuvEflSX87IlN9NEooP42qhhlhgVF8Vz6Xn+ybEAD+lG8TH/vaMvGT/ILySZOV
         FQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549436; x=1796154236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=fYg7tslTiFducRT8hPDUbGYiHY5vFdwekQP4UReHCh1MpVQ40s7GNij0sV2Q7tFVpD
         eYlJQJSyrYY9p6okJQ51rZ+x6oxsFZx0u8AsMp0v3flPh2pRZgrPWOnEV6RE0LUcOi5h
         eRUggRP8HgRRgWzoFzGU8cGjhb6W0PefRjy76fW+oty/GmfvFrt2Jv1SSBZevswrFPP4
         K3cohvZed2hSqLbiek9tGEi1YLyXceTtZI5uvBSuO6mbQPlvMPMtWkQEUHstpjujqkQi
         iZlEgmrQJH1kE79GzFrBGIqmulkn3Qh14i/aHx3bd6G4u06F5s0TVLkbw0mioR9wp15C
         qhtA==
X-Forwarded-Encrypted: i=1; AL+hErGjG3AFrdKL8GmQLAdTUsqP1covjYJl25MTIVbXhkVVy1OsZlKcNV5Vy6jdL1aDXIqXHE1AM47IgRt96RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+02NuQuhmb4kk30CXQFjnb1vwwz2w8iqgZ24Am7Y7E3F3eckOg
	2V4dpCJZUOx1rP72eq6hwM6V7yt5gFh2pnqOg3N3hL/bsn4Wdiz43RVicFcksoQda74Yl9QdlgX
	v8W0/I0wnUBhOWUV5pow0YbL7rwDA9jg=
X-Gm-Gg: AZFdTZdqAqKiTh0DVK2xWk2jSD989pQykwdFsREBc4FgUBFhdYllHEIaVg4N8SCF6X/
	YbNP4jeNOsJue1ygvs//zMBgeCSNRY8W3V+X7SRfl2FusR40ke9Vl/mOWGb4+X1t6OcxiSv8b+b
	QLbiTBtl52kr25QbRS9LlNrjlSUwq2ivCGKrMaINx1ZEpZDjtiN0R3ncChkar5wCfRJq2GM/qyO
	nmZFHxvcV4AeuVKAmfyleZyoxwGdo1o5IDEw8LU3eLksAFI4lTWk3axCnNjC7IcM2a6rOJsF8z5
	jJf4bPuNM/qNU5v/H3op/aPfQp+M77JvadwDsMSYWE7Ib1GBrF4nw59YbWUqB2g1K50PcAy0OJ8
	rN5h18j1EO9/AjLy/1QJ7zM3sJthrcXWlVyQuMLsm2SU5HUNuoLbPs8DVR/iTfjkQiazqzA==
X-Received: by 2002:a05:6402:4416:b0:6ba:a7af:b80d with SMTP id
 4fb4d7f45d1cf-6baa7afb918mr5940678a12.25.1795549435824; Tue, 24 Nov 2026
 11:43:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120174341.35873-3-juanagusnicco@gmail.com> <179554500253.3135.7129341529911265513@kernel.org>
In-Reply-To: <179554500253.3135.7129341529911265513@kernel.org>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Tue, 24 Nov 2026 14:43:44 -0500
X-Gm-Features: Aa3M54q0ymEgH2iGN0KHi3f7zWEwzt_ONQZiRG7AaDrvbqatZSJsXwDKB0tlvzg
Message-ID: <CACQ4AciO6ESeDt4M1ifVgnVVKAvE=c3n6_aqCQ4kjpzpJe9ZNA@mail.gmail.com>
Subject: Re: [PATCH net 2/4] udp: Keep the bound device on disconnect unless
 connect() set it
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes the universal bugs, where simply binding a specific
way makes a socket vulnerable. It does not fix every instance of the
mistake, which was repeated more than once on every protocol I looked
at. I was already aware of the L2TP bug. Its fix does not belong on this
commit and I don't think it belongs on the series either but I will let
the maintainers decide. Also, the issue is pre-existing, sashiko
misclassified it, as usual.
