Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020846;
	b=mIwJrUfewzAkX0JJMwylhVXQGtjYGNtt7ojPgLmNUkVEu8HIwVZ5SB3i9dmGITlDeFdL
	 xJeh4jOdDXx9xaYTE0Ev/i0GTcE6MUmkF2QWv35gUDJnbmLye4HZ2OBQKGJJ4s3j9OD2z
	 TVhYdSA/VYjBYrooOkCjTTaNsbDZmYtkcnaePHtla2ff1XUxB2I1TdNoKVyDZEKcQvql/
	 PgQMO8qkHXD4hvKsJIWXSysox7nG64TxLW/YN0tJhHXpwCVkDYFI6xbitIQCrHmVww1MG
	 DyyxCF4z5NmHAIhBjY9MiIFaS88riU0UQUoRfsgBQdxebz/4URF2BqhRVwTXahmwIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020846;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EOJ8Sv/YlC8vz0y+8TQ4TF7t2l9IIfJq2FXNg6WSXn8=;
	b=Jlj5RWynKkCi0Yc5g/rxnM7n+sQ5h29pKccRQu5ZLJiwAe9SijJ1529hD7VKdF9+kvKy
	 gVu4KHM4KrjbDZAgca97G16ulY6RNqUbovkVBKcBiag4Rz3BF4VM8zN1E64dYy36esDoi
	 l2k2acha9rCXnmZW4gSA182m8geyPVg177+joF7PUho1BTiRNc/Ie9rDcFXwNH2LBnXon
	 qxho1/MYWqnIEAhtad/2DqCMH0UgW60pj1PBIupKlfSENb3FQE53B8Ze51+kOQBdsInVn
	 DIW1uLtIMWamjWoHdM0qHyF02Iac6DCzearFj8zdR0Tx4GC03srr0ZOaniUdhV3Ab6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.com;
	spf=pass smtp.mailfrom=yandex.com;
	dkim=pass header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b="IoPwM4/+";
	arc=none smtp.remote-ip=51.250.60.165
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net [51.250.60.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B56560A260E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B56560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=IoPwM4/+
Received: from mail-nwsmtp-smtp-production-main-66 (mail-nwsmtp-smtp-production-main-66.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id 37EBB100036;
	Wed, 18 Nov 2026 19:53:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-66 with ESMTPSA id YrdcVw0j54Y0-vlfv0vrV;
	Wed, 18 Nov 2026 19:53:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1795020834; bh=EOJ8Sv/YlC8vz0y+8TQ4TF7t2l9IIfJq2FXNg6WSXn8=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=IoPwM4/+G6iuBYnsqs6wPD1Mec6CqC38mgXduK3ckxC8/7q2aZJEurdTHiHuxi43S
	 PpK2fLEqUxSU7yojJa8TJAlERPg8rM5Zt0ywQL9DBGpyB91anpM61xuQURfBl7gi0E
	 bqJV+oqtUGAb4P1MSObTvsB9m3TPvvSRqJVfvJiM=
Authentication-Results: mail-nwsmtp-smtp-production-main-66; dkim=pass header.i=@yandex.com
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	xnderv@yandex.com
Subject: Re: [PATCH v2] drm/nouveau: idle the channel before destroying an engine object via abi16
Date: Wed, 18 Nov 2026 19:53:28 +0300
Message-ID: <20261118165328.53341-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023152332.9420-2-xnderv@yandex.com>
References: <20261023152332.9420-2-xnderv@yandex.com>
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

Hi,

Gentle ping on this one. v2 addresses the review comment on v1 (wait for
the scheduler job queue to drain before idling the channel). It still
applies cleanly to current mainline (checked today, 2026-11-18).

Is there anything else you would like me to change?

Thanks,
Alex
