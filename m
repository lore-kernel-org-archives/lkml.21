Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427292;
	b=Bi+ORMEyYV+oAqjjutp5q0L4kj5ZX6/+0ljcVjoK0a79C+dLutWJbHFrbx/oS2/f4ix8
	 HIPWpVy7f62WBiNbZe/MehHtOeGYEe24JGQlgm86ShY7sIAy/oHZTmi1ux5HO+OJIf/qI
	 u48bE+nMK2T8SZSDY7IapDH4avsW2wg2CyeLq2NBg3vU5B4bRykOxol94pjkj7fKBhpgL
	 d41K+1vLQZVTQEu3s1Dl7UG2QEH33N+swfladkXz5eDLGVijXBh9hTEGKAQEp0/F5+X0h
	 Y+3D+lMbZE+5SHlvjDlnHlU5UxI3z9p65d2IpMiI1DUuTU6/2HhCMwSRCXL4DhHb14Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427292;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=gDqxUua/SVNz+vUi7hngGeTF67Hkrr8BY9nXOqW1A6Y=;
	b=co2tPdMt51V2s+jnXqK1/kRawezS+uySQHOVZSeuF+5UnHVoun2zKiERD/yRXh1oFnNv
	 PGEGqvZbpAZ4UD53OkAehU+uw38p0A/t7tTNPXxpJMeAFX8vk6d5KNL9MJZO98/25NjQN
	 zzXDns5zehyriZhWYFb+WJW+EbLgUVjeI3yHPV2Vf1QjCDdUilXs01ByAWvy5TQh0ekEv
	 dRas61DZd1hWVgtkKk7TM/PGvhBSMagEyN47/RlovgrzwXhyfMex3/ySvGMGu2z5tVUgn
	 AQ8o02gjsxz3ZMjdHFJUWcqrL03TPdAJ7I4xNuSkK40GKgMe1RQkDiiX47YJSnKd/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AVmDqTm3;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15561606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15561606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AVmDqTm3
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jY1Ml0MrfzKn2f;
	Mon, 23 Nov 2026 10:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795427283; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDqxUua/SVNz+vUi7hngGeTF67Hkrr8BY9nXOqW1A6Y=;
	b=AVmDqTm3VArUTJdoiJLZ4Z2Gyk8uUPTVdPM/lMXgNiJ2U/lwAzNNnLNlMHeG54WnYR9xE0
	EyUZZKO2jibClJ4IZxDQrpchMTNazfwT3kf64NqyHGUyPotbq4TKCVarz5OtxoZPXoXmoe
	RPA030SPv66QqlyfO14dyCgr2MJ8p8S6VZ9F0xvwJo8SRQMBZUzCfTegjXrlymENssG6QN
	mDx/efVKFJSxBDHDxB0183yqqvbYg/e0dtwtGzDzXNjn3MAclZfb9BgWw0uYSjvh8lQo1D
	2sVIRX1arE9rgfXS/68+xxuYOlGHI4NK7pOCXY8n56JG7iYyX/C07c1lOGZBNg==
Message-ID: <6fc8d8cbb05d00ce6ea35f8e3993d9ec96fee9da.camel@mailbox.org>
Subject: Re: [PATCH v2] dma-buf/dma-fence: Remove dma_fence_later()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 10:48:01 +0100
In-Reply-To: <20261120112702.2970576-3-phasta@kernel.org>
References: <20261120112702.2970576-3-phasta@kernel.org>
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
X-MBO-RS-ID: cc13eacd4bd05710574
X-MBO-RS-META: wke9cicegga7jcb4mfses1j14whsm1mf

On Fri, 2026-11-20 at 12:27 +0100, Philipp Stanner wrote:
> dma_fence_later() does not have any in-tree users anymore.
> dma_fence_is_later() is available as an alternative.
>=20
> Remove the surplus function.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> Changes in v2:
> =C2=A0 - Rebase onto misc-next due to conflict.
> =C2=A0 - Add Christian's Rb.

Applied to misc-next.

P.
