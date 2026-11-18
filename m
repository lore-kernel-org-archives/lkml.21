Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795046131;
	b=iTAVOFygLZtLzLRSyajatk4z9iYQEZOqkaXNFD8gHZqGnXvNy3NDen3a3qqzZ/vrJSjV
	 6nITA9DQfGCVIYfmrwETx0BmAMnVLWcIN6XPqBlP0YbQnWAIPm7BZg7Sr142I/nyfLixA
	 bFPvEW1KDDg9UEzmBXDi9iLa3vLK/OrWJ9Za4IAgXd+E50X1ZbtQYzdLiiEv84uEbnOc3
	 3naOycv2cSyQ3p14gC9SYY9uxcUFgDnEosBotAvZT/TMecWU9Rny70k3A4m8NP3jTC2/6
	 kX1ecpbu9UDshR2lJ++OrnbrmqUvDuWtw2hVUnvVTOKGROHrlRSs48Mcy5NMGhD+bKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=63Ce5k5KgJ7kCxdquHv1PxDcyB7zPmX8ddeWZ4cRjbg=;
	b=BnEPKFTApFNxT1bA5Ki4kYz5H/m9hvauRrj4GLtApJVkst6/k+9XVhozjrnTPSO7vuRz
	 o9e/hSYLWseMT1XMcB7nDKW+mEkF4PfNILKQ3pZ2+G4f+HhiKR5j6BdkQb8tNGi7w+DQ3
	 SZP6qIQFVkXGPh+Yw9jBAFnd0S1+zWFAeG3TE/OnMt9jCAibSj+vzDLu+UbHd/QT1DOir
	 3Zzb3dwkGtkUab5V7Q3+LlJRJdMIvIaBaPzBM+klqHcGa7BQIXaWfB94AnfHJ9fU+0yKV
	 3HVpPtrfAM3ok49lIPvs9+ijOlepnJaflz0a3thOzdbOTuZKCutNsR3JYT5g5xegVPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yivZrPCk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B3606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736B3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yivZrPCk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so4438667eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795046130; cv=none;
        d=google.com; s=arc-20260327;
        b=YDWnhldMUYYvbokX/MatX9BPoZrAHJbBPPAa1YtXgMo+3PJ7kiKHSXZa+BZHmNqAb9
         mSp8jhfkUVLySm8sXUYZG573fWDOVd9aCALfzNpYsqHLDyliw8t8ONDqVgw36DV6t1Tw
         Xeq59tPoD3x7aBYKIMcm19CQHlrbgOz2eCVtpAJ2x9jwcpJw9qNKkRUsQUCECGXET7I6
         qYMPHCBFgwJgsb7J+99Gr1ZkqXGMjx0qpobcjLT+bHGFXUQ170aRr58LPGg8D3Qg7hmh
         PI2vWlTEsYYQ1yzRjupq2yD7M8QdsiZGjeWTf9WN3OVXrhy1NhzcyDtmu/63P78poTZe
         1y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63Ce5k5KgJ7kCxdquHv1PxDcyB7zPmX8ddeWZ4cRjbg=;
        fh=B47/0uCZztL+8rLVBW5SXeUYBqmW1S3oAQvM7j4N2XI=;
        b=WZsMDklgW1JSBhzwggDXw+o81RrxvZqs2phMeVRw9fuUzAGob1SzTrmXD5V0lNrvxW
         Begat+O0qjw9FFiZaFXpFTdU80O4PN9bt7LCl9N0pZSOeRhlUD7svgZi4WgV49WQcmcZ
         kW+90SjtCPgZv+HGOxI286+GXAeckx3Yg2o9ST+tKzw8FHQTlnnLkmIGqQoUq2TTGvE2
         +WvUs7yxVGgz9slaNSc7CgoikSrYbsHrzBjpeHlRD7DKXN+iRV7o3czZmYtwbn6374P4
         3qx91EV/ITu8p8Oxg7fv1wHtYNUaVKiGu/TX/0wnOhpniJ8+akONMAmZHXChOyDI4PEI
         S84g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046130; x=1795650930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63Ce5k5KgJ7kCxdquHv1PxDcyB7zPmX8ddeWZ4cRjbg=;
        b=yivZrPCk5f/OCozIaNGp55SaUe35b+G21+zGNvZrVV2d79vuBlttIhK0LTV8Nwr9Vz
         qTNhTU2649T3vwoKcLo1xMZnpjoP6C/ZktdwmeNgPxzRqHoOX7RpvCj3CyUINJXKzkgw
         7vIwPqahDh7WyA+4EpeQFvCjsmXO/UW0rXTNtKI77qhvwNkgFUXRv74xC/56xvY7gFZR
         oWjr11oR243nekAXJYPNL/HXx4KgiZxiYWU+CPLIPHaA5FpyBvh6kmWbaNftuTXHh+vl
         zMZgB6gePOw06Qi7lRXsMuWy/ySzxPY9It4HKOKKFpO6AOQZmWpaQknlWbKOOankx5u8
         Aj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046130; x=1795650930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63Ce5k5KgJ7kCxdquHv1PxDcyB7zPmX8ddeWZ4cRjbg=;
        b=LUx4J6ybFJbrbtdijVLd5Xa7wlD4MtoKVmv95U6vlSrXHPGPiWFEr9aqu0VBMNi6xN
         pAZMMKBhOyMzE1r5RbcIZ1y5eoz8P2A0wp+m6q3O4nAfd4mZotNIBiqmdDe8dOqDXTos
         AxP8lAvfZpsaqCEcklL6GBz0F7tgbNXAmpVTKCGAPpUr74gb1W62RGBrVg6LE2jvtUZr
         DCnXWFijbQF0yB67yW3cytv9Jl4L85YJruVy0f8GVDmaSeLIY2R0q9I1qebC1+z1lT0U
         zr9AiTDAWk69+iU4JOZt4btCZS+ONrwI/wV5VHvyCrTFkZ1eisS2a8u9kXZreLOsK8AU
         lKYA==
X-Forwarded-Encrypted: i=1; AL+hErEUetesIZ8FLSKTUTn62ZEZ7nehu8DlfBs4FyiFS0lT+EY7DbCcyDYwXUCRed8D7oYQ9sntcC7Ld337j3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/falTwFzoROsS60cglEucOVVNFTVMvp48N0ncQX2WYTSdK/hL6
	485H8q+jnprFha954b8jNEVq0oqACr2FoNc4oT1BgWYZcGJKYqe1Cec3JaRCsSeaPFCykK0BUZX
	ejo/ebRgslMQxJJnfG77LCFfNF4rEX0o=
X-Gm-Gg: AZFdTZc6wCNpRgrfIAeDeoo/u2gaItjq0Oj5dRZ4+ZKQ2+TyaNlGl4SVx66qg/M/ErP
	89qN+51FLE1EZTUVQ/RLfmFtCCGPt43Mw3h5KcJKt7eC6ZkobprevXorkJvg1XswzoVTVe+PjvX
	JPkOC33qClwP5eofM5dNO5+R3Kit3xV0NeJ1ZOeRsuiz7gY+KkUQsGv+cjS6eQ+W7XY/ENJ/KtX
	nAgAQ2cpTnm3wZq9kidKr8p4PLbrfSp/GTfj2lKeq7Knlc9r8lEV28KONiaoWnNOGlrWJ0Bca0+
	X2/k29GTEaHq0qxaa5/yqsymb+QXBt/sLbAMN40LMQewO1LVHCAem359QSBLjZBz02/mN/Gndi3
	MsfWFlnEXQ56lVt2FbMqpEx0GQpH/a/QMdASAGzArPAsu55Adcgl2kkW1koob
X-Received: by 2002:a05:7301:32cd:b0:375:c862:34e with SMTP id
 5a478bee46e88-3828093e35cmr3846344eec.20.1795046130285; Wed, 18 Nov 2026
 15:55:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
 <20261028164539.3471833-6-henryzhang62@gmail.com> <CAPY8ntD7UqYwGfSOp4XW5V6574e7o_bq_hnzNfVoq8y92-3awA@mail.gmail.com>
In-Reply-To: <CAPY8ntD7UqYwGfSOp4XW5V6574e7o_bq_hnzNfVoq8y92-3awA@mail.gmail.com>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Wed, 18 Nov 2026 15:55:19 -0800
X-Gm-Features: Aa3M54q8rC9hdRr05t6wi4III9tiHqZZwbdjk1rChRebknqJVFK6FeLFd7oXKKg
Message-ID: <CANTW0yq8H8WO4kg3kZru7oZ58wnd0go=8F+RtSi4GL3SsXW8Dg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/vc4: dsi: Recover from a timed-out transfer
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> Whilst it's a belt and braces approach to work around the issue, I'll
> have a dig next week to see if I can reproduce it and see what is
> going on.

Thanks, that would help. In case it saves you time, this is how we hit
it, on a Pi 4 with the panel on DSI1 in video mode, display on:

- It starts with a DCS read whose bus turnaround the peripheral does
  not complete, so the read gets the LP receive timeout.
- From then on, every transfer times out with no interrupt and STAT
  reading back 0, writes included, until the next modeset.

I don't have a reliable way to trigger the first failed read. I have
not tried a peripheral that never answers a read, so I don't know if
that alone is enough to get the block stuck.

> There are very few use cases that have a need for sending DCS commands
> whilst transmitting video, so it's a bit niche. The reset stopping
> video isn't nice although I guess it should be fairly brief.

I understand it is niche in general, but for us it is a requirement: we
need reads (with the bus turnaround) in both video mode and command
mode. In video mode our test tools read panel registers only when no
video content is being played, but the display is still on, so the
host is still sending video frames during the reads. The same reads
have to work with the panel in command mode. So a stuck block hurts us
in either mode.

I checked both today, on our downstream kernel with this series and
some local changes: 1000 reads in video mode (display on, static
picture) and 1000 in command mode all completed. We did not reproduce a
timeout in this run, so it did not exercise the recovery. That does not
change the failure described above, which we did capture earlier; we
still have no reliable way to trigger it.

I haven't measured how long video stops during the reset. It is only
done after a timeout, when the link is already unusable for commands.

If you find the cause and a fix that avoids the stuck state, I am happy
to drop this patch, or rework it, and test whatever you have on our
setup. Until then I'll hold 5/5 in v5 as it is.

Thanks,
Henry
