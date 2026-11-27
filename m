Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772677;
	b=kKHutE8Qpu/ZGOJK0oCU4p4Qr5CKfOQhqo2GHb+eUK47QuqeaJprL/rXB6t6bO1lFmmb
	 7IxXETnNPnteZDeHlShBXtEFz+TiR7jkhJrwPbtThSpD9j8qhdrRm5dGw1oMF45Up272E
	 jIbiJ2i3vosACtGG25VweGqWoanYIfuD2eRxoKckDLoNjhrI8/x1wDUUumsJeQxNKVMDx
	 Kz/9S3cmfGvAcsrSCz3GxeRzMDb4SYnjla7NIHc41zVue+l74cwuEAumgm1hy7bGL3a6O
	 tWaVdezlA9yEEBCxinx1oFuytv3+fZjX9bA69GhvT7ZdcQf/2UYI7mHbe8uHAe+DM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
	b=r30Zt1oo1cGEmDZSFD7ey7WHJfsD0XHkvJqZMcF2ZL8MKtV8eYuA6OrbmbIAfp6CyySr
	 6Y8I+WF9hDODRqj2Zd+dgB143AwAAxJP2BP1D3amY5rn1GUsQkiDa+FXTx3SF42nXy1RJ
	 qH/4TG4t1PDWABqBASJAxBDTOEHb6MdupfQs9mU+tV3p2CZBzItS9nWv7SxF8hE0eC62z
	 dQ9rexsSMNEa5RiSSL0Ozc95dfr5Dj4Cx1aT93/0MCodyuc3sRm3LkjRmBsILjbAd9dyh
	 SKqKcs7mpL4x9BykL6XVwNikoP45OjG2HqJqlLBiijMN6oWobMEa2rp38TQO8D3hvrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=UPNfFUJ3;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A5606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361A5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=UPNfFUJ3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso4803075eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772676; x=1796377476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
        b=UPNfFUJ3OPgNiFJcut+ESQpF4Kv4m/UrytuSlw2ndm/nZ8u2jql5CSXJy+hKwOMr7l
         4aDAbraTGHtLNoq3uObESlkSYzfdc6si0AnjLw6pm9nMc+djTksnEf3Nf6UGLUvTNR5K
         S6LMSCEFA5meLAZwD1jBUyWBPlBdY9qilLtmxRLPyXsnbG38OXinr4+E0UMBZofHbg06
         s5VjoiPxH7bIdt3Z5T//Brz42arkCHZ9DV8Qx1uHJJySgh5K73sYavk9bD9W/HiDEkox
         0BcaYBG0U2/Ega7tKoE0iejegxFgAZKs0w/aM2rqp29DLXS260rcPZahShCtZryt7u9Z
         cQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772676; x=1796377476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
        b=bAnbvqYyUyyj8xRMaTqD0XbwbC2H6lq47FJiwdf1WZmYm/wmab9zBQ/qUS1hjkZbL1
         plmSOpWuX68/1EMly4EXhp3JjAgjaS6PsqYRnqldcPbHNo9EQY6FgXK1vHaQhCK8Nc6P
         San+j2TeCCYlK592JtZAlc7qHJmM143ed53658fvG9mtSXolpTmudolZw8yvRZ67pSKc
         EOc7FKCDtEq6kfDf+R+GUlz+1ci0V0nz+4Gnr9puc18rSWNJcftg2F79Nns7cQD1mS6s
         JA/nXqxo1k/9fbTWkEiH4f/Fgwe1GsfpBofhS0xEVZp8INKIsYw5/kJOfHdJgQSS5Ca7
         /iEw==
X-Forwarded-Encrypted: i=1; AL+hErFPYocaKbWlwne9ACcbIiyppb/Nef4Eo8bYO8HYn+boOfaSuZebYL52b+atLOkBTSgUmn9dolZvLlldaDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MVu5qOSohaEJlD7H57tlB4KH6UIMNE9udDq8kqHqmxr7AusCW
	0ssHlKByvrQi1aw1iZEgzoXBRaGdfIjYht15zQHdJXLzvgK4HTVGE65Wbzp5dzNDKxo=
X-Gm-Gg: AZFdTZfc+z2kyAqNaatOe51EzxnlT8uIjm1ZT1zQcsu64eP771fW4kiIShZ2p151Uue
	RiH7E4rRsu/bW92Uc5un8CSn15vlLL/IfqaQqHnL6ufFmKFCbQvfVDeaVk1u48eSza5q0alVRby
	Iz+TB3+2PTS2b5iNdYs0YhdkYVyYBZwsvYRfZKEC/vKjXsE6Nhi4UX6bIAcfkv6H6qgNFNGO+7B
	IXsi7JeJCtpHXKKoCiy0K35A5gc50h58h0ReJ7yeEIh2WpUqZbgfDaGkAn7IAHZsAMbGND+bTW9
	Ro6zqS2cIqHJ4QQ3o0ZFsXyum+t6ciypCO7eIIH8PQzpKUzNh9qvdQKeztfycX/pOVNpEVrPzBz
	LZZSs+ydqAhVhYh+/KHJQP0PzOQ/RwHODfG+O0DC04oDoJVhPeh9+sYVknMtIf+lUwuyye2a8WJ
	p4UE//IiZhewYB1R/q9TA1G3M9/0+orPdXOklsma37Kpp+Y6V27v+lWpgQ5MNsD+QwFGmb9NwuA
	3H1lSoTs3FrsqVmyT2/JvmHURwWaKXwkFso2W/BAq1EK4iZ2KZ7ajRIXGt8T8guW8GJGwY3W7sK
	t7pTIcMhGUll+hx67M4Z9GY546n65T6S0TPnDyVa1c28hpP7giHmk74i874I1HkjF/yGSOhsbd0
	ZvbZn3jn1RS+I3mvref9kAlDrTQXw5n0HdUkrYMui/hSjIEjO
X-Received: by 2002:a05:7300:d083:b0:380:f112:3cc9 with SMTP id 5a478bee46e88-3857093f06cmr23196159eec.38.1795772676367;
        Fri, 27 Nov 2026 01:44:36 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm84928712eec.4.2026.11.27.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:35 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 11/12] selftests: net: add amt_v6.sh for an IPv6 outer transport
Date: Fri, 27 Nov 2026 09:44:33 +0000
Message-ID: <20261127094434.2965392-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572062428.3135.4041633001964825666@kernel.org>
References: <20261125191450.2497936-12-omar@blockcast.net> <179572062428.3135.4041633001964825666@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Nov 2026 19:17:04 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this also skip when the amt link type is not available at all?

No, it did not. v3 checks `ip link help` for amt, as amt.sh does, and
skips on "Unknown device type" and "Operation not supported" from the
kernel.

> Does this skip in the packed-attribute case described in the comment
> above and in the commit message?

No, and you are right that nothing in the tree emits "IPv6 address in an
IPv4 attribute": the exact-length policy refuses the 16-byte attribute
first, with "binary attribute size out of range". v3 matches that
string instead, and the comment and the message quote it.

The Low finding is also fixed in v3: the message no longer says "plus
jq" and says which of amt.sh's checks are not carried over
(send_mcast_torture4 and send_mcast_torture6). test_query_egress() is
carried over now, with a third gateway in the first gateways' /64 added
for 3/12.

-- 
Omar
