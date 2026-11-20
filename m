Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166304;
	b=b9CVooz3HyiYGTVN4O7F+3GMxPS1gb82XgcQplfT93O8kqqsYwn5++31NS99ejn9ahki
	 A5GjuzH0fMUzmE2fNy8wJwJesNfELQWcNUjEjTAGFa7vY3tT07h5lT32jls+N0iu4FL6/
	 Q2a/RJIajfTjeRXltLjTVIGz2bb6m4cjNQcb0rKFDxg4lJfdEJP0jPg15Hwmd1F3cS+9Z
	 7ThEUdxHGr/wA4g8cgR5yts4Gak4izZcAuEPSrBUTKLBzMQmAnYLugVYRauA1fEyvdU9z
	 qaUTQ/Ycca4gJ9mGs9J6viL5oP7OS3Vp04CQ20/EM+t3BEwmmZN1M/L/mbY6tEZo8cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LKNcUjiPdctgglYR7W2eprVTeGLfvr9jOphlzyK9oG4=;
	b=rCr4zVh4mSF0bBypS/mg03kKUD5QCbNd68PQ4b+iqBQ00AO3oJizkK95LoFU+MkDxyDW
	 HjgMt7+a2YaHUT0kbxeMTe1MfsesfBA6rZ1zMU3A3pv6YYxyKhHj/z9MldhhXwNyCio8C
	 +FimkHZNjlhGK4njxKrD5qLEk/JYvGxEOyUI7NJ7Au7BJPEeTZ8iDhO7ugeLOHOyh8KzO
	 5WT9LB91F9y5YIf7iiS3ny3yxxB7wMuxhtcwwMsiVJuQFNas1iY3WKLYEqW6grooL3nPF
	 aOwZGdvKUD6qBcj4VZ/UC8XlU35EYL9zbg2hNt9KDgf5UZYFL6LAzC/GNdQbNHYLuzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUSjm1Jc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E30606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E30606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUSjm1Jc
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3ad85432c52so1063331fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795166302; cv=none;
        d=google.com; s=arc-20260327;
        b=jAtwS7HOY1bHAn0w6j6IF1J6wkQ1bi92ZM+G7+3FR6vImF0s5YOjsgkusYXPfP/w+u
         hiuq6SI6MOH+mIBbwy2IhXPp1FcrhcyzZSkA9Wlv4WVPT0ruAL6DHlvHliveipLnuoib
         WYoq3ejK5lezJngT6MtQEeUs5yM5fIaHUcvg1YSZ8h3/WI64TAPt8k8aYX98gp7sX1D8
         tZkG356+Y73CG3OIMOCfRaWXpPULKrsYphp810VygdDOG2XYFbqC7PriSGF/EjEFumX6
         8sHXxW19guoVSwnYTrTCD1VRLojjk3B1ZzmFGE/wE7IC8kdrX4w6JRmoP/la4ZpKgIA/
         h3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LKNcUjiPdctgglYR7W2eprVTeGLfvr9jOphlzyK9oG4=;
        fh=GMyEyc1iSrfWJ0r3XRXkoORzmpERRXpI5FgvEUD194o=;
        b=JTlusRlnE7ZvzFRIvgqlDT53S5Kwz/jdP7gP7LygPCkGy0kwHbplwNX2iXsHVHSeex
         E5uGHJRMhFvB/D7HEfRzSeYm5NEqNBiSPv+w4yCBeN16FmwA/CTPjb3QPIRgJajfmoap
         dboXiZNKNGSdFOIhT+fMdCkyRSJGz71sWVqA8uP5QmNsAJJJZifci0q78y6DXTslZqrz
         YOtmd2TiKpvpZ5CHgfPrpV4JS8KyBxkhLEsgyspY/xrj+tmCdSzRgoQIRo23d2zdhmKO
         WFszezv+w+7OGyBcWEsJMuy2rUUJK2v0oxIJDqZ+CoeAk2hl8FRKBqB/ZAbW+QzXXS9Y
         UnvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795166302; x=1795771102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKNcUjiPdctgglYR7W2eprVTeGLfvr9jOphlzyK9oG4=;
        b=yUSjm1JcMlFPAsTjjciCOT6VbhYtZel/rl8MzdnhvqCHX1W59hE7lW7zjKnqSXvpja
         IabtUR9nHiV7QABRzNefTYeQgSzepAQkPLjSN67hY3o6qyEwuQI3OY+5+Gw4tHJE9oTt
         1CShlDPH+Ji0TN4A0nBOcQzYht3K9sfWm1FoEODg56jKqtF3zGxZGrIDIstje3XOop9j
         9SglQQswBDBowOGV+kV1j4VxpldFe9eWnNgE9ZKGpS6DcxB0BI/jYJfkUxa3Eq5K6r6T
         wpkXKL/n2TZ3LtGkiH8uugYc3FqOoNYyCSFl6WeZBChrtYLA2hEeGD7IJJoDjUdJlijn
         e/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166302; x=1795771102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LKNcUjiPdctgglYR7W2eprVTeGLfvr9jOphlzyK9oG4=;
        b=S1Mtij1Em5qR5fIodOmza633bIYGPBP84AEIiPx/PgU7nDJuMMUjr+6bRB+RuAfmlC
         RLbVxAwPy1/Pw9QFd6Rc+NR134PAZc/A4DCaiARVhBqwnPZYf5q6tLjuZ/lvLxzdkVry
         d1Ax7PSpO40MleadnFDgzKbSObwkdDBvBidAj5JkFkI5j6R+6lgSksg7jRXz0hL+7q0i
         gceqs5C6OhAAWvj2zafJ7hVxrmFqGm9HKMgNCeNLpC8TwtUyW4ffC8BPenuJ2J2nQpUX
         WzG5qDQA9gqv7R0mZWQ4w3hwUR/DG+KBQk3Kq2h/tZMVXjNTmvfUpmkf33ZsCdeNRmo1
         OtVA==
X-Forwarded-Encrypted: i=1; AL+hErGHxzCDJ5POTa2vcDVYny5vlkCYtvjVtNs5Ls14KyN+jzBu1iGOCjfXCK1puAtIU8s+vpPoEIgV1yEqRBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YDD/8mtg8JEMy0cBW9jr8+l8tqgX5FTmVbhWMoKpx0lsHji0f
	3D5PNF+a1jvNpxuTBlR8ygyJ6xzLbx0y7JY9zqr0j+P/reqipu6CeeyFCRJSFbcUXh2sl0SQV1q
	O/cgbbEXFvfeA2b1pwYVRppoJ3s2P5vg=
X-Gm-Gg: AZFdTZc6+h46MIlbIlIn0ELzpNXfPqHUYUNUdNCScg8Vy6EDA6tLDGD85ak95azUO34
	MZzE+wtTHy/857R0pHs5OXlXwWeghcK1baG5Qi028mbTco47egFDHteZZB5ALwwXqHE6eC219/+
	DY173yhjarg4we0WAWZ/RP0SQYSZRfepHfpWP7PCLWjqmS8XryxJhafYGC0XvvjAZzfGNyAcMGe
	N7INtvFN6awTOqeKco+IarLQDrGvPu8ABGhcdFvIwe8Mq7CO2SxeMEoAzI+ln3vIH+T7UjDe21v
	mJZT6cXMwcFHURZF/+D1qhHqg+CITAOSPzqH2j+EdIv60hshMqr8oNj7lzhiO3MztzRrEbgJ+f4
	Q0FAiY0CHbqt+T2LFs4RmQvloiyQ8Hz8qDNJZQZYssE/eybYO9s3XIHcsI070Bie9vxIQUrC0eN
	kYt1BECpCUuFDhqqGTZOEwuOrkIQ4CLI8sGvDolKeH+QCXvR2FGecI
X-Received: by 2002:a05:6512:3503:b0:5c0:a65:4e79 with SMTP id
 2adb3069b0e04-5c1bc84aba5mr734450e87.41.1795166301858; Fri, 20 Nov 2026
 01:18:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112214303.16198-1-dennylin0707@gmail.com>
In-Reply-To: <20261112214303.16198-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 20 Nov 2026 01:18:06 -0800
X-Gm-Features: Aa3M54oQtZ0qOiM5E-eLggRfvzG84Hvr9XCvrCFnTpiJPy9BPjxn70QmsI8m6Zw
Message-ID: <CAGEkeHe7Vsqrze1oxA-L0urvOwAx0w-FVsAJ__LMRBJbujwmSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] f2fs: require write permission for ioctls that
 change per-file state
To: jaegeuk@kernel.org, chao@kernel.org
Cc: daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao, Jaegeuk,

Gentle ping on this series.

Thanks,
Hungyu
