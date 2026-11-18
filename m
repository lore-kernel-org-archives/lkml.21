Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006502;
	b=1ZYrbIXI6AiI4za8egPkWEgusT4CfK2fqcvh6Fynr+Ejl7rR0h+ONh3nTWDgXzOKkiT1
	 x0+t6n7ErTlG5Z72jO9CrrysgqdH+NmCJy5mhmKxHxyjoFITFtlcyDHt1CcWopwq4VC6R
	 E2Kqn2+G8UCBdsCUybkpJOll2kQkZY8iYnx7RMHNwBrKeJkOAw7Y+7ToPI1xCh9yJ28j5
	 SjLTmB/Cya8UYUIfz0UFBbz9ut6ytzX1m7bNjnOi00MyVYtTn0Ep8cnYXCASDQ6fNBoB6
	 NmvoSBLPJ5MgEwC6P9Gs4pI7m7ALWSliMVW9WBkGQDPWfMTO1HHUR8dduQ9QuCu8lVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
	b=0F0sPvI+VmEdHNmprpq+2jHgvtYC1Vc47ZdWg+nQ0MCyyg+x39rZ8zLFzv0UfFo/q90R
	 +4KPLbX7Df9r3+UM8CIQ6usGD6EvaMAgCU/Zmu1LxTP0fDUFGE11bRASTNt6QwkC3L63Q
	 xNv1UshHMgGD5ApPYaQDOlAjvY45wax7sw4Pv/TDgypXMXDR89At5mpyjOY//TpL7bopk
	 TA+DLQzFlEc/qeHK4Svyi1bqIKR5Eai6VYTd/F6Qp6OwTN7bVZr369tJHwBCcamtLyduz
	 zzYGv19BiDX6RpfKiUDdTDWa7BNHXlR7EyQ4a80uvV1PvLggFyYfxlF/myXbBeIuR0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EphXuosv;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB84606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB84606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EphXuosv
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so570153b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006502; x=1795611302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
        b=EphXuosvpZhHwI6IoqC6D3LFGaENEM7sy1ZRdj1dyjNvm/QjfgRYFiVIyZDyoJbans
         FRFPiwS3AhE0rk+194XgBKD9NkHDmBdHYWEgsBdjvga8q8Ct+cNz82NXuvLyOtxPSNIJ
         ubK48OlxNXIPGW5oMX34QX+tkLFND0cFhvJcGTyGf+NfaiaNNghgtmGjEEIvZ9RKWSm9
         b6PraheLd02vraVWfG0AeqgW6NJfgBaXvNWTsTEghEHLUIRi3mLXlBE3H8dltr4f7FXT
         ZMoUyJFl2W1TZ38XlUiXSZLai/CUSZMWGOyZfgmWRpp5Hny09i+czp77OG+jp2/0xJhS
         /MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006502; x=1795611302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
        b=12dEOS/gUgHegwuG6RBVrFzQbTSduwngVjnA9dAH7VFVv/XBp0eeXxbevuJI3hrkhO
         vAymwVM2k5aWBnQOSZdMKKAIN7k1LJ0ygYFyM+pim5XgJ0vnXLANXOeNUr8TcNur4NxW
         Z8aaundBTUBG5baShiAyciKfsoy+jEP4PIGZYgJmu9vD10vCyHXXkp6D++yorWfzcve2
         YO/Tu61Om13pzud//AK6LC+FVcvbdEisPIslV90qBJb5Rum6fo/7Cx0J58ayd0hxYMZ9
         xSBl8t6DsKldZF8jZYGIBGs2Frtf4Iu6xXVKxhI65hYfZ4PMhtxllo6MRUlBbDLfud9G
         7mPA==
X-Forwarded-Encrypted: i=1; AL+hErGMHGZJNaAoj8twpB3MJZ8AZcb0xxcMZqb/EsKL7mJ5Bx/PchYKLuDlIZ7Fea6/XfddHkufQAWN10n73N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n4fcuqklFjAje7ImfW5i/9dkh/psWV1h67IC66aafMWSQszcg
	wJLfWJECokPnyF2jMEKXA5YIEU/bhuNt2mrptjsvCwqGhVGe7i2NGuR/
X-Gm-Gg: AYBFou31LRY7CxHzuVIVpcS60REbjENGBZRd1r/FD4wgT4W2rnA7LPYat30sGHwyp7Z
	D6ficBl4bEP72rfRHwVejtk5s0F7Fg90K40jFPEvjSymhJ8rkRCWXKV0KU/VF6JDmigX8PM2lUi
	pjJKsvujqcK57gS48IujuY///qpFCTzkLwUF8kC6IY8CUJxKR+x0PXCjEmhbGtqYlpjxcZn+Ols
	Fa/okA3tteMLJDdD/az9kQ86j565FlrUuzhR4/pgdvFt2GxECctp9plxk9hrm6QwnN0gyKljift
	wZy8tDF0339vTRirCJ4jYxDa86A8hX8OZs6CdtKUbuJGt51LOU8FAaH5MncJSKtnN3c0X4ofpLY
	FCgEwbl/C3nnOYEXMyw7M3thluqnE88e+6gEwupYwafBRuHqrEg9obG+tvrCw50/eUePWn2SUMC
	BIoZXyv73bEPlbGhsAHp1UXSAmmpBNLMdSormaIymwHzBOKCoDmyvyHy4dHU8Yg+YCoisPIHQQ0
	zI3hsBXLQ8qE8HkGEoBxsLxyxta4BqliVcYm1/dAoVehNdrt0Y49eib+N3IpH9rINyqqoW97r4M
	RkrZZDWqUUqPpV3G/CdedLdFfLtQjiWSUBHrU98STSZsnsmx36faPW+ivW6LeclaBIUvWdON/UP
	3i4FaVi/Q3OibDqJd5mgLXX2iC7IBIBAEW4TygXS0EYBnOMGtFMduZl9Pk3kt2BTsggEJcL1RHG
	uL7T83BsMm8LnFbRmpWY/z2Aa4BPVbqrG8/teW7FlRzwFbuKg6evg=
X-Received: by 2002:a05:6a00:1d86:b0:8c0:7517:b9de with SMTP id d2e1a72fcca58-8c5d3e116f1mr2084551b3a.32.1795006501788;
        Wed, 18 Nov 2026 04:55:01 -0800 (PST)
Received: from kapoor ([2401:4900:e034:2676:5ea6:3ff3:ed45:7b44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99a7fsm1199883b3a.1.2026.11.18.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:55:01 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Wed, 18 Nov 2026 18:24:49 +0530
Message-ID: <20261118125450.12512-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bbdef966-c5dc-4101-9246-b668e00f62b7@kernel.org>
References: <20261117172612.25535-1-kapoorarnav43@gmail.com> <bbdef966-c5dc-4101-9246-b668e00f62b7@kernel.org>
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

On Wed, Nov 18, 2026 at 01:34:31PM +0100, Krzysztof Kozlowski wrote:
> I think it is premature. You just started contributing and your early
> submissions were clearly showing that you did not read kernel docs
> before posting.

Hi Krzysztof,

In June I was still figuring out git send-email, and a problem with my
setup caused those repeated postings. It is also why I was not able to
reply to you at the time. I have since worked through the process
documentation and my setup.

Since then I have been working steadily on this subsystem, and 23 of
my commits are now in maintainer trees. I still make mistakes as I
learn: not grouping patches into a series, writing commit messages that
are too long, and sending new versions too early, as Andy pointed out
here. Changing MAINTAINERS is new to me as well, so there are mistakes
in this series too. I take those as part of the learning process.

I asked for this entry because I have become interested in these
drivers and want to keep working on them, and Jonathan agreed to an R:
entry. I understand your concern. If there is something specific you
would like to see before this entry is acceptable, please tell me and
I will work on it.

I will not send another version until you and Jonathan have had time
to comment.

Thanks,
Arnav
