Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503936;
	b=R6pOpNM5aHJhL/i5O1MVgzW0dETOyBK47e+JE0ca23pa0m6bxhhtUAeAXUBfIv0/7bTH
	 NZTxiBjqqdg4dNsLb7n6yRPXuyUzEFi8czODIlU6WyF2jeoqjfE688B4iMUgYnQ4x3fpu
	 cxW3X//aFEF8wsQUlGuVOWLUhZl4yR+xVchthjKD6aAbWO8awR8qENmAQc1kAOjKeuWl9
	 0nCJhaKnpCIifz9iOYJGFNypLtmZToibHSmAUXTdX3Bvkskm5TTyw395ytKhC6UR3+lsB
	 Wlxw6N1TzVz6ITXpK5qkC/a8joYyR5gQm8+ZOip6llx6WMvAfIZSV2TSpflGQvzl9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503936;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=mB0bBkuFjwWwfGm/l5OgJ4sed2U7buqLQ6QEJ5MWd3k=;
	b=SW72fteXsm6o0VI2fV+hRZHMwDg2Hm2isqlRbyNeS3vuqzOh10sB5j2I9rdznCrky/jS
	 hcsm0F2MbzymMmSL8oOs+rj6tkhWzrPYKArnN+dM3ROCKQyI91m9WDy45/QlrldpC3tme
	 yKNvvQskYar/AN5YXPuGPgXQ9rSaa2Uh+o5LwCEozfR9evKxjgm/d0suSuSKMRAUtDIjU
	 pvqoai3pn50Q7vWDTjBKnMr9I2aMVZcnvfV8pEumttsdZUzxIsifBZWv05qY9NQZUUMBz
	 xrxsBcBzezGWUd6pAqsTi+yVxtgkKNwAvKVk0j+3tVkGcvHkzFbdTPYRMAahYhqWz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e3aScI5x;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e3aScI5x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=mB0bBkuFjwWwfGm/l5OgJ4sed2U7buqLQ6QEJ5MWd3k=;
	b=e3aScI5xNqev/MEbX4mMQEIJ+Lxgdr+G6yinyb86ER3BO2HMB+BnmR0CpGcA+T
	K3jZNmtqLfXAD1nmYMZ34ky2Uf5phA7TR8gJ1CA2cAOJeMAxfdVHY8RvyBy1R1cK
	SxsXiSpLBjajdk/9aS746hQWnbeHMquyzfYIUjU6U0Fk8=
From: Ziheng Wei <zihengw03@163.com>
To: Jiaming Fan <fan.jiaming@hotmail.com>
Cc: amit@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] virtio_console: drop device reference when DMA allocation fails
Date: Tue, 24 Nov 2026 07:04:14 +0000
Message-ID: <179550385418.475969.16498839426484137487.zihengw03@163.com>
In-Reply-To: =?utf-8?q?=3COS3PR01MB1025140B2F87FABEE5871E39AE7442=40OS3PR01M?=
 =?utf-8?q?B10251=2Ejpnprd01=2Eprod=2Eoutlook=2Ecom=3E?=
References: <20261123102321.8605-1-zihengw03@163.com> =?utf-8?q?=3COS3PR01MB?=
 =?utf-8?q?1025140B2F87FABEE5871E39AE7442=40OS3PR01MB10251=2Ejpnprd01=2Eprod?=
 =?utf-8?q?=2Eoutlook=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
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
X-CM-TRANSID:_____wAHzs3_NgVr_lZUJg--.22286S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV-BMDUUUU
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7QjrPGsFNwg6DwAA3W

Yes, you are right. This is the same issue and effectively the same fix
as Michail's earlier patch.

I should have found that patch before posting. My duplicate search was
too narrow: I checked the code trees and searched using my own wording,
but did not properly search the mailing-list archives by function and
Fixes tag. That was entirely my oversight.

Please ignore my patch. I am sorry for the duplicate submission and for
the review time it cost you and the other recipients. I will search the
archives more thoroughly before posting future patches.

Ziheng Wei

