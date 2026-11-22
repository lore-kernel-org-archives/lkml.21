Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344496;
	b=f3w19mpK/QFZX8YV74J/asGZxLGTJIMua9M8gEBqZShngAODflotK2eEJ/7JXK+J8iq2
	 /EkNl7rh+nLlQ9AYAM7sEZXLY2fci1tiHhKIRmVBoMubXWugIOQd3lonV7S2Go9VbNt89
	 raTHNMIkpJJyQGelgty5AC2/li8Vo7ZtL0OthPogy5BqpSu+G82w8rlsUDZqSeS/WVNZG
	 Y7MDAeha8IJzKkuANeGBfXdAJWHS7RGFHYebR5J3kUMY2fsilgVO7nY6sXiJRNZVj5qjv
	 BME/+YRGOvx766rR44LCxnazB/JtAw5/mJNujKpOD4SUMuzvKrHoJX6BIZdE1N3n3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344496;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wrBHMPssuDFbJ0ygZXLqCK7GMSoJfXh0zKZ4j6u8ldQ=;
	b=UXD8AJlMpsdUXILfY9X1Oxc4SlxBtl36y1On14oUpwaHaD6QXZIN9LSOWH1fLL98ws9A
	 aakrbcl8T7TOU+ULduOpNyg469NvrPG0x2dZYQF/EjlloEON8XTtTYdPzBJ4BC33Ev15i
	 UC24uVN+Hjq7nwJbt7nV7CKZZCB2UZhmYBtaqGK9a1n30gOZ7g9oKqr8HRSSkVusPSfBl
	 lX2Ezp6ZywOl8pRfI+F6vLI68e5ZbTS2ozFHqV2ab4HdTwsd3PyuQg7Kp8phL++ooOtI6
	 Ez6+jslhwaQhto328Q7VVoronE3oqy+SA4g4qByssWvat91+oijJmw033E83/7/VfLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHafh1WN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE70E606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHafh1WN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6352C1F000D0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344496;
	bh=wrBHMPssuDFbJ0ygZXLqCK7GMSoJfXh0zKZ4j6u8ldQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aHafh1WNZq5PluviVv8Jc8bRUZAqsEy9z1WecXyLpIEwekvxOoCgkvN1HAC+FX2r/
	 dSwztG1IHw+UsIKsqWbi0GJTDbrOYRE8EIpfdjO9zkj4LCFxzj5/ak7fo+HJTz4V4c
	 xrePvgRtOBJ0mUbYo0bkPBH7Fqh9gAJupzznZAi/RHIfIEtZBb3wAYEjfVg/mnUIZd
	 ekGHB8m4bXUJmIv03Yh118ljtPTXhdXoiYsGbHviWJb/ceNWZPViyTLwJnserFb66z
	 5DvVwKRTNkumnZA2AQRNkE5Dn0KTms2vmOd1AhV8TDHTF7BBAE4aosB5ziZtWdfj1W
	 hulezqCV6X44A==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a192844so46659466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:48:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOZ6hmwS7ZmKPPhb5wSsACCqyvBQeiRHJW5mRuu3rh0QRniSVQGxfHn6LslqHG2WvjMXQbk8sHIxgp9+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lVplFmbIs6bvH9hEUW3bd09K8sJjh5qVJi3BCUAAhSdJOLkgM
	RD9EXSCvkexhP4QWKicsG0G7sPjUCE5+UmrdzzGbjyw5VCDEqVksxafGR20ekVwylLeJIPWA1dP
	+/7tAmsLJZGc2JnzfaphM7XslH5N/fao=
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id
 a640c23a62f3a-c513aaad90bmr710965866b.39.1795344495083; Sun, 22 Nov 2026
 02:48:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-3-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-3-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:48:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9QOQ9w-v4btiwGrPg62RExoTqfKPK+fX8GNy-dbcRx7A@mail.gmail.com>
X-Gm-Features: Aa3M54rAQpooweqJMeCitGw6rjZrbD3QOKXH8V86NBmJgwh0shSXGyr9YoZlsOw
Message-ID: <CAKYAXd9QOQ9w-v4btiwGrPg62RExoTqfKPK+fX8GNy-dbcRx7A@mail.gmail.com>
Subject: Re: [PATCH v6 02/37] ntfs: preserve cluster-free counts in attribute cleanup
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_cluster_free() returns a signed 64-bit cluster count on success,
> not an integer status. Several attribute cleanup paths truncate that
> count or treat a positive count as an error. ntfs_attr_rm() can even
> return the count to callers that expect zero on success.
>
> Store the result in s64 variables, test negative results for failure,
> and compare the full count when validating an allocation rollback.
> Return zero from ntfs_attr_rm() after successful removal. This keeps
> successful deallocation from being misclassified by later reporting.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
