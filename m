Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167750;
	b=BG2OvowkG7c0j7X4Lpqs61gZwwPnaiYcIg6dTUN+Zr6UPbpZ2YcsrOARbJV8nvJW8Bzz
	 aA2KwSYQaIbtmnc2KPngdSdemO1H6mlThJWv7DYgR9ZpDPzMhA2ZOUIpE0o/paQP+3LdP
	 yz7CuaB/DTjKwVAxKsZ1+cxABa5Pv89SY5zqHeH2Q1vUgBrntL6m5Fppv2zoa/Tz6vqjy
	 5Ez5YIy03qAUJVxIGPIFm/1u+Skyl3GPs+yvuozdwU1yn+532VRQZMMf64sXLolWqiRRr
	 AOHyrJ5E4NB4QZHj2OaP3Zh7VGHJNXWSvVuZi8lHw04XNs6eEIblZbAU/l2UMKJtRNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HYiPFmYp7+iZyLswjz6osZNQEu8q8a9IUu1zdV4DVbg=;
	b=aVPdO4+Z2FGzOGh5FNbT5bVbhmOKPQ+Okz06bvRxDe55u6DbWW1cUwG0evO2EX1YYkT2
	 pu4gqT2IROZiKUIVUapusd+0Na7vseRAkxkNMBKfRaZrhOLQ5c1LkXXvy8vxNNO5Z1qqb
	 dNPMHt97oNPFf5iJ59X71epuwldx1aITJgMfh90BBd3/rEsQr9ODPUlJAkcGMWsU9a0n7
	 lcDhCcDk7G190kdxi8F+pQMqaYeLMi/oNfBdvIk9JK2Cich4Mjx9FKNxs4S39hnF0UWlW
	 Fvi25/hEm9jPbjGuPGoM2ssI4DPytEmRPx2Y3wYVLONTgxpNDHEawfyMhlluOtLi4mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwHI55Kq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFD606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwHI55Kq
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-862ac6a951dso362545a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167749; cv=none;
        d=google.com; s=arc-20260327;
        b=jR0JtzcmAqLelPTo0Im7vFVzh4EAaejUl6kwmffvy1MPgA7+wZzJTNIAF3AzVcTc+I
         TFU7EH1KuC967Q4xmGUkRj7pdZnunbCa+BgmMPCX5ZfNYWZFn9UbKMwEQNHEIdyyg69Q
         dmvtGzkI+q7rOCS41i4Nxi0kHAa0AFEJzQkETCAK2pae2/jWR/A1yrOulMsuGPm5fA5Q
         eyVdMHAMsqoDDR+e7+Y179iAHumz7Fxo+SN36fwjVHlKBUIQpdSTTnD3mdo7xOk5e0d3
         EUokByvRGaVYqQMnyFzjW8GcyBsVpGATbIcfvrrBK2TFOgVUWsm3C7wNFAiQnnjRItCG
         cFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HYiPFmYp7+iZyLswjz6osZNQEu8q8a9IUu1zdV4DVbg=;
        fh=nzjTJ5xWM/KrZpomc54fBEp+A8c/6AGIQZxWJUSMmF4=;
        b=ZK+OmO9qpaeCmxjHq2CEnDm9JYfk5JARLoYanmuUXIwd7Ib2yheoKCQ0Qh8+fbyZrA
         TkplNQgC/fu+B4rMcKfwsP4L1AhGf8p7yKQcOwijJh1P6zJ8NccqtW5ZnqMh2gY6YH5H
         Sr2OMDzStkkfw/b5s352O6iwfFw2abvHtrRDYcU7K8GiagzB5hGf/LYiIHBulbPai63w
         6u4vCR2eYCtrzLsTs0pzhPdMozG1EH0cONFqXBfr+uBRjD5ikT0qv7DSMAFmFv/fB8PE
         3YaZxBLA6S0cvoAZ/hEiEEvgBZAO82jegXW4kvF7A/z1PwnMkdunIBM9ngLjN09YluFU
         nWyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167749; x=1795772549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYiPFmYp7+iZyLswjz6osZNQEu8q8a9IUu1zdV4DVbg=;
        b=iwHI55KquNFv3FjhNsLZYLjFYBm5qv912xHG9F+auw6n0WH4+2+9u/+84Hud5pNIqF
         SPgk21vSLaOLa+YUwO/v0Y5L2zfh9rkCfO1ScSjzzMX2Z/XbD39RmDCQBGCrcCAr2WBN
         PEd9cjOHsbIlQKSVt59jmC6OafSxaqV1yd/vB3pY1SPDM9OFhJHRwTsJh0DKiJMQR3a7
         rycKG5lRfs55iEXOcwft4RLaJE10wAkCkvOjL4G3+oEUdYrIpZdTjj/acU8avsygvzAt
         zA+CuhHNMOu5zIX18iQCj9/Uf8OjtKIytM1VzSw29jMTYYy6xYQ7pVrawMYXObBuzE92
         G+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167749; x=1795772549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYiPFmYp7+iZyLswjz6osZNQEu8q8a9IUu1zdV4DVbg=;
        b=PwXZrrYsKSB5kgaqchxVnpyKMb6Dpl7/L50eNokzaPkVch+APJ7yoph5dIgKrkyu81
         T3obVU55PLhYvEEZ1vqwUXXHf/xK5bNj8Jwsu1u7q+/+1CQAsLsrVqSpPCvdjrY7a2e3
         JF9rCK36bNmBj0aoEwPWDJuajlV3lW9Mg1wx3LYEQ4q0Nwrw/tRD4+i7JwXfzaAGFwWC
         wCh6Pu//zEEabHfkDtfKigOgsal9pPMlrPkCpcYUticUSIF1jNUARPbokKVG+bwlKmEl
         6VbjpvvlSYIvwogqn/eRwvcupe/ral4mWiEnD1CYlczdYo0P0/RHYvhEnXdSgCBEKOvr
         X42Q==
X-Forwarded-Encrypted: i=1; AL+hErGz1Uh4V4huB08oleocXZta2xmawYSlvhqCdD1E69cmG8SVc4TzbuR9P6TbtyR/6aUufnmkZftZfuOWk0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+040NeZ+65dEtvYWh4V07xy7L4DiaIaq5rkq2Bhv1fpZIW9B28
	L+dDJbmEUJUDEBu0hRr/yeJDXJ+lbxaoTesCfgQw4A/lKjyCh7digWbNk7vRDEmzyDrWqMrSI85
	BvqnpScx1l6FMgFua5G6Jx/VLTeDhexTv5rntZYhY4L51
X-Gm-Gg: AYBFou2GsQqcGs12JarhVB3pQuV67wzrM17Gzs+EtwWw4OqpwOKR8HnlAu9oCNDHkRF
	BEVqaB4cwHySl/jy54rxJ+rLk2+FQeGFNk7KU/JBKgO/J3ezjEmkMNAtODmugUuu6NFh7iOJ0cX
	PvSWP2a3KbJCOVp+4JFGZ/KSQvlcdJZ9t6bGI2jf8XuocwA3vkFkBIFnMtfqcVC/7RdCAEgn5UY
	C9KUS8nVeU4uydb48AfesuESitzDqyd29xhc8MWpeQMANOXpmSN7B5aRFdNVvkJUWVQ+jRhrAlI
	RCj7gcSRhgEr6Z2W2UCtqmQx3b1uK31VqnEw4NgjnoVC4O54RgePAX92Z9nezSy9ilwMfB7NlSh
	6rB1AYWrVgmIdE6B+JlT3ROrj1aT6SLD05badVI+PdFO4OPNxqSQ56ZAETyY3iwDcyD6I3r1KJk
	f17hVcEFWuKhOa8hi8iVm3MWYP035Gy4av/DktlPcB5Ynq2sXQfguq
X-Received: by 2002:a05:6808:23c2:b0:571:c073:748e with SMTP id
 5614622812f47-57a056c8709mr3278883b6e.3.1795167748870; Fri, 20 Nov 2026
 01:42:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108075357.43331-1-dennylin0707@gmail.com> <64dfd4fe-46eb-45b5-9eb1-ab0564bc2d47@kernel.org>
In-Reply-To: <64dfd4fe-46eb-45b5-9eb1-ab0564bc2d47@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 20 Nov 2026 01:42:16 -0800
X-Gm-Features: Aa3M54pavuzVtQLnDUZtRz03vVYkTYh6vhGn95UQJXSbIJgWZPsvg1RiTYB2wBY
Message-ID: <CAGEkeHfeO-_2MS-v_Mn28Dn7vmLfLzKjx0yTnFGvnWC8F5C9xg@mail.gmail.com>
Subject: Re: [PATCH] f2fs: require CAP_SYS_ADMIN for fallocate on pinned files
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 1:42 AM Chao Yu <chao@kernel.org> wrote:
> Or maybe we can call f2fs_secure_erase() on the blkaddr range after
> preallocation and before return from fallocate().

Thanks. If the erase runs after preallocation, could a concurrent read
see the old data before the erase finishes, since reads don't take the
inode lock? Or should the blocks be zeroed before they are allocated?
I can send a v2 either way.

Thanks,
Hungyu
