Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965868;
	b=ELD6+ER/SSP/XR3MWPtKEesZwuk3AONbOCwjySDuLpusuGAgzwVJTqihVVN9J6nCltWP
	 SJsS5Uhk2LP+1G1lNZSX6e5m+hL7XeXj/DjLaKqpO5Je6SEWjGAIgCdhCzYmKzHW9e+9n
	 J5fTV92l1/MZHLEDbiFNEnXNjSUyrIkD+aagOgVwrvjpf+UeN1IWIm3inncqU8X032cdF
	 1eXZ0EnhiobM5XRnl+EE85orX+hzupBt8PYhs9sBcVApYIqj5Xq7gXq0rqvUroDpX1+7N
	 XexPDNrusVKmeuNfWplgSmqMzw2yl361ojmCwfCmj4uVn+DoPUFnwUtzqSqY0f7+2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965868;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=v1KarP2iIs9tV6yL2HgYux1xhA64h29Df+lfc0Qc784=;
	b=hhHmEhaywdNwvus8+KpWp/U+UPayykKse011YpD2yVr9wvb9z0d24p7ULSW0UrIz7w/I
	 f8gI2c94t8HCxs3EEcQSCoXhwpAdQkviTu6g9Iu30MYnZRwZO8KUYdwFxk9fiMy7OPixd
	 LI+QM/jcqHXGGdAiYslrK1m/88tAFtN84SnPkC4vaxSqgAhGXZA7W6cfipB/z9ypdleXk
	 ft95M0RmkMozBVzvdrBxkAjznD2tFnJGgmEr5gz66pceCETEir3uN4mFDjNszW72HXM6b
	 m22xhhyPld1xACHvzSDEcs30zBW9g7fgLZdfwt6nrq4nDApnFKPpEQiEVmb9Siu22MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 7CB27140262;
	Wed, 18 Nov 2026 01:37:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 8AE1520024;
	Wed, 18 Nov 2026 01:37:43 +0000 (UTC)
Message-ID: <2c7b026955f5519faf7fc8672bf9ac4fd3c6c4fb.camel@perches.com>
Subject: Re: [PATCH] checkpatch: recognize FIXTURE_DATA() and
 FIXTURE_VARIANT() as types
From: Joe Perches <joe@perches.com>
To: HONG Yifan <elsk@google.com>, Andy Whitcroft <apw@canonical.com>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com
Date: Tue, 17 Nov 2026 17:37:42 -0800
In-Reply-To: <20261117220522.904290-1-elsk@google.com>
References: <20261117220522.904290-1-elsk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 8AE1520024
X-Stat-Signature: cfgaiz7mt97jt9iunownabadyqkaisek
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX193gbGEHUrGYW6I4K9W6JzoGzRQs+ppfwI=
X-HE-Tag: 1794965863-39128
X-HE-Meta: U2FsdGVkX1+4FcPAqQh3Vvbe/apNAgyu3wlHzrq4iC73ZyaPPvirTQ0ZWWOpSNXS49MEjkH3lCsMvIpRqyj5tvQ9bH9XPDQod6bZKgPvvUOLZrOHS74sspeudQXUSaaQM/CXmj4qqWDKMNJT9Nl9sEdXWFUo30VqOpDsOd3KhwbjYBB63OPF3Cb96Zs0WdqM0Q5NIbbWtq6FXhW9yqU3iOhemS8wIKmnb9fJWiUi2rv0N+laNjLsdSznjJt3kFo34wzNiItUGHHROU5YODJ7ScomG0Je0P2fQ6tqjQ5dysa3Jo3zxp/NVxg6UWCkQYfI

On Tue, 2026-11-17 at 22:05 +0000, HONG Yifan wrote:
> tools/testing/selftests/kselftest_harness.h defines FIXTURE_DATA() and
> FIXTURE_VARIANT() to expand to struct type specifiers
> ("struct _test_data_##datatype_name" and
> "struct _fixture_variant_##fixture_name").

NAK.  This sort of stuff needs to be externalized.
