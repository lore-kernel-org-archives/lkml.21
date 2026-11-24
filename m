Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795531233;
	b=el8qUHeWiGNxKOVh5FTxKcM8JCayeiTPOhYkyVtj/RqAKSoQR4oC2h9QP1BkOQ0pIfqI
	 UfeTK5i+5YpbHSIXkUiucXkNURIUzw1isG+ObmC5k0f577N3GpjFdRXbXMDSaoyHYGU/d
	 aM0fNZFnCZ3FXJOT4KADcmrNTLjHbIzQju1E3dUIWXJynBN0a7Yi9D/vjo+GVwM9hPA6o
	 Dc8WuQ2dojgcvTepOUeVF/fZ4FQXe/wbR8IvNyRsaFNQhK9yBLufDzyLd7ycYQsSh6O6e
	 8mH7GD1g1qr/5wlj7NwWXXgP5diLaclmLhnmM7ZevUfmXLZynGmDV/WX3ihjUZZ4IjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
	b=gLi2dVk3RRvgtErYcxNxqsl2+pLsH1m5BiJUJdPqsUhoiBRNHw20xklOugYhDnHFMcV8
	 cGRdDNGJWfLDL5cHac3w1nRvetZi9peVlVRvug1bMcvwlCKQi9I8Koo3pM03uPLajYa1k
	 2aOnxari1yUrL4Oa7ACtggUNvbokh/L49Sbq5dhgdLTnYnPntrduIMKAdB8cxm7wbvu2N
	 dBCcF/xsFRCsmNE1EI0gyqWyQv74lUsHg71AN70/BAVO0J5O9hLSPPwF9PTsOmzhLHFu+
	 ly6YwiKVJIqChUPnH48w34ZQzXvTMuOow/zlKa+NMH+fphsaufl14r3R7GXC3AgxB0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RE2fpDmm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF5C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RE2fpDmm
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4ea3c5afaso30714517b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795531231; cv=none;
        d=google.com; s=arc-20260327;
        b=b4ZLreepPNVhCElUQhqjmPNeA17tbaJoxE5axealyr1s/vK/gb2D9Sivu3PNzyD22k
         DkjxekSvT5Fl+GIpBVrlUjM9iWHOkZt8LmOtBkVUzNZL9IFg6zR2pN0R9yIVkzNaofmo
         JHL0CNr6M18vTAE74qwV8ycmx4l07PNKDKXXfRgxcLYe4YlKes9JJTSa13MUNALvisRk
         vbaF3zjTEyv9xTSFxuCv8QT7na+7Fjr+qlCFo75Rn3kT4WGfO0gPRIOOj58ZxNLTbsWx
         IhcB7Per6rMe99yKMVL1ECRTzTKgKrQLMr5u6HBWMjrHdH+o1VvAOeCca0aZw7RS2nRj
         8OIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        fh=sbrnkYZRQR0/zDiLqva34FR+U1FxJjXjiY9T1kUmu+w=;
        b=KWnkdVn+YWuVJ1nRiImGApvtUrMWwUvecWBAN/dinqKcYDHeDzD7+mgNJ0JbvrEK9u
         PQ0Sv4Vg1oR2GxFn7HIaT8Mk4VSBqSEKm7JJZroUVWLfLEOduSSDdI9cmNPkdAWlHg3/
         LHEB06O4e2yq6U4FFQhkY+Kgk2n1OhV5vBrF4mq+4MptHGAEUtHvmGQ9VEGG4DxLHQgo
         7/u972qOYoR/xIEhdPG+jsWbLwGJknO6veCsdbeabIbRNb0dq81CCCIW1kOeOqFA87Uw
         Bsa+bbC2SrKTlUesv/JuLHEVuUuCzdqY7c+xRGvYjMjPD5S22kSx0CD7jU0voqL/6ULT
         BqSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795531231; x=1796136031; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        b=RE2fpDmmRGxLAB5IwvdG6EeZPbbr9KiR6/7V3FNW/P7FVUwlQ0u7/j/nt1MBMwH7Zd
         gQ0SA9yYYy34SXMXny/mFO59eG2X69lXh8LZ/XWRh47U0GIyJnRvWEoj5O6YDwOsyq68
         uoSH+XzdMevnVGFIcKB8hjLNwBHuAojdPfo8Q4T5s1998ADW+bcYxDePAUWpCRV60tnm
         X+utJIh52B2fM002f1SQR5yQPBbrnYMSf4G4T2116SRRg4TtpC4T2qOG1fc9iJZ1nXYa
         L5XtBEqFcXfJYb1y27zSqdspO9gY5ONlwzvsoBDBntPW1ylbAk1B6nwBBQCgrXB81bXQ
         w3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531231; x=1796136031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        b=h2RAUxNHjatia3mrQ+HDXTnST3VvnHmrmUJArVf2DEV/VPOgS3X7gxgKkNHh3s59WJ
         R1Xmr+jHwQ1AAU28V6I8IobiHvw45Xri5eE5Sxz9bGZl6SKfImlNSQQdwBvyYUTQ5qg4
         yUEjN5lsP2gapEdVhnU0daPcKfLPFaeFRt6d0EyUyjmRdaucO7tDsdTmuInDmqXnc3hl
         /QJ/rVrlIleMP4zy+RaazrbVRl073+2RYOHJnAnzzTlVkdqhcfv/N9GFaSwi3DXhRDMt
         zjbzNRoqRaTfv6hrs8/zXYZqfj7+W2ZFWYEpNscm5hubM1ylPRPWl3H8hO31TlYJ4sAe
         U59A==
X-Forwarded-Encrypted: i=1; AL+hErHkgk/NuUc5x+LY8eBwF2rTHP81N4Ww4FPcMvUsh8I3y5T/ykvB8lNpYLbFMg5wkRFiIWBoLHUAkCN+BwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8kduCryq61nRX6iZBik6GHWhZXv04k6kVrvJLKFrA73fp01hX
	s+vSmpt7MH1tlp4qE30TvzZPlcAlzxPDiMIFBm80C0nkWdUECaNoDH/ecdFRvfMKLsdpEyAa2ec
	2Tw2kLgbe4zGh+bRn84Bc6ZSnJ0WBgykpvG+jvCbK0BEREGPOjjIZ
X-Gm-Gg: AZFdTZcfJdY6zQaNas8aq/oIdvZgUFvK/6G90wjnD3jyLlcxjWu5VLhSm2fTEMuTME3
	IDOi4jIU9KF+7T8qF9gPDWrV7116Od2uDO4dlOyizPHw8Rt4pdivu6NpVX5Adty44QbqtNDbUWS
	oaDrNLHmv2o0CD59waNS5lLYAGily4t3ZKsYlfjXo9DyhOUP9NrHoqIi8k84uew6HGL0Gsfj6Lx
	/Tjh8eExBJTQMGlBsH7pLKS8CCaxNIUNpwAG6ut8QhOyMDn9P3R0M0GqjjIxfdJyIo9ly5kBz/K
	UQCcymBdmT75SxZyy3kEJ5r84qciINCe7HZb3ek8HXpTQ36nB0U54cc+8dbP7MFmsDgzC7jECM/
	1wQSEq20xqxXF0+DgvyO4Bj88mv0KqQYNI2RSNQ6cbS3tOWpSt0cD8umzJJmIq8ZfJ+kx+w==
X-Received: by 2002:a05:690c:89:b0:8b4:e17f:f811 with SMTP id
 00721157ae682-8b52043b59fmr49196567b3.28.1795531231263; Tue, 24 Nov 2026
 06:40:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
 <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com> <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
 <49f11bcc-9a21-4181-929d-2a45448435a0@foss.st.com>
In-Reply-To: <49f11bcc-9a21-4181-929d-2a45448435a0@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Nov 2026 08:40:20 -0600
X-Gm-Features: Aa3M54qhMiPKmawPDyPT-hF5V5oAzCmKr7vYIkhlrbnrB_GG1bDCMFqEyB5qmNk
Message-ID: <CANLsYkzvE2byGERHnijGKyTxbEtL6Lr69si226ONnpzWXr7fHQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio_rpmsg: Fix config space alignment
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, openamp-rp@lists.openampproject.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 12:16, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu
>
> On 11/23/26 15:12, Mathieu Poirier wrote:
> > On Mon, 23 Nov 2026 at 02:12, Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >>
> >>
> >> On 11/21/26 00:01, Francesco Valla wrote:
> >>> The comment for virtio_rpmsg_config says that this structure is
> >>> naturally aligned to 32 bits, and this is desirable by some
> >>> architectures that don't get along with unaligned accesses.
> >>> The content of the structure itself however isn't aligned, and the
> >>> __packed attribute prevent the compiler to add this alignment.
> >>>
> >>> Fix this by extending the version field to 16 bits.
> >>>
> >>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> >>> Signed-off-by: Francesco Valla <francesco@valla.it>
> >>> ---
> >>> Changes in v2:
> >>> - version field extended to 16 bits instead of adding a reserved byte.
> >>> - Rebased on current master.
> >>> - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
> >>> ---
> >>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
> >>>    include/linux/rpmsg/virtio_rpmsg.h | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 23ff6c8b7a20..27282475a732 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> >>>    static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
> >>>    {
> >>>        struct virtio_device *vdev;
> >>> -     u8 version;
> >>> +     u16 version;
> >>>        u16 size;
> >>>
> >>>        vdev = vrp->vdev;
> >>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> >>> index 0872cbca4593..57f48d537de9 100644
> >>> --- a/include/linux/rpmsg/virtio_rpmsg.h
> >>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> >>> @@ -31,7 +31,7 @@
> >>>     * the structure is naturally 32-bit aligned.
> >>>     */
> >>>    struct virtio_rpmsg_config {
> >>> -     u8 version;
> >>> +     __virtio16 version;
> >>>        __virtio16 size;
> >>>        /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >>>        __virtio32 txbuf_size;
> >>
> >>
> >> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>
> >
> > Applied.
>
> Could you tell me whether this fix will be included in 7.4 or integrated
> into 7.5?
>

It will be part of 7.5 and it has a "Fixes" tag so it should end up in 7.4.

> Or perhaps both, if 7.4 becomes the LTS release?
>
> I would need this information to manage the compatibility details
> properly in OpenAMP.
> Regards,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> >> Thanks,
> >>
> >> Arnaud
> >>
> >>>
> >>> ---
> >>> base-commit: 5f22fb20497f4983094131f00a734362300d22d2
> >>> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> >>>
> >>> Best regards,
> >>> --
> >>> Francesco Valla <francesco@valla.it>
> >>>
> >>
>
