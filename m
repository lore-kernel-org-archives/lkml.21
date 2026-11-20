Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193588;
	b=M+wQle9vaIV+kCJlAGHmC0sI32BXy3Wlf28uvCanQJmULjqy+MSurRPkBJiypLolzFcf
	 8E3Uvm7l8ab/4096YMWR5kd7HfbzqBDQSb8lfR4jvhzSWSwabT06C+BBdyxqNbebCyhIm
	 7zwpbi+wX1SHzDfsbfA3YSZi01v2abzX4DjINfo72VC5WAuWwrubBCs7I3Y1wpOgEDhbA
	 lP3ckbWkjGxaOMO4lVoOgaucm4bip13wWG5X2z5jAKqosdal12BwmET/KUCmv1etnnpQd
	 0JI4V1En5ybTS6kYDy1XDipNm4/7u5JKywHDNCAneEl3YlKj3/H4om4Eiz2rrQfQBZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193588;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A2nLq6am/T/zNwphpbaOffHi5KxUqXtUM9OeXv+xYRE=;
	b=1Eg9kAKB6HGNrC2rl0k0Ie8kVhy779gMYul46zIQ57qHhoNFulPz2zY4rIn74BJAiff2
	 hVVixbL3foh/iWBHpFAVxwZNHUp3v0UxvOOJwjqpPqG4U3jfVBR7n1z2LY0kxhYrFqx/n
	 4goRN5wgef+dgoQOPYAIZ+d5fVEzR/yxi6ztl+fBNh32vKzo9SflaQdyTC8Rd5Rhe03ma
	 Dxp3x78ZHFvbnFof4BgebF1G0e0ZsloA0ni4nZmE9+RyXyN7ykzmVKzGUTlDIFYkNwM6S
	 AloTIs3iKedREjJ52C+gMoeNnknYBaSr8PX2el9e0eo0/hoOSuLwszUOpTQaMXA6bzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcJS42KG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24F606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcJS42KG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E3E1F000D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193587;
	bh=A2nLq6am/T/zNwphpbaOffHi5KxUqXtUM9OeXv+xYRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YcJS42KGCGCOoF6/uHN1RQidhqQwiBy145eBAxwxierpntbvxSX3vdpviAtOOQpAV
	 qEwFjik/t9YX6YG8BIxCFqzwwxWmkHUtJ6eSh0WxSAJCE6n/+fhsdMYtDv8W2EdqsX
	 M+QU40GGN/oZnfQhm3qOHEAeW3quqh2DS8PSxWibXOEebfsSqy/x5z0oZd/Dh5Iyib
	 yrAJgVXFNoK2OwTepuf+ODS+mURbIeJPggijiY+L8WHcO1GXFa7e+y2JtG7b7lP5/q
	 GO29Emhv+8z5oTooi8fxUPp/IJY4uGF2ex7gxhz9/yPtnLoHpDbvvX7uVJ5bOq0CWG
	 AbMqkCSuJizzg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c102ad8420so658749e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:53:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE0vHlPZxePWqDg3kURT2m9htuAP3Er821jlPhZhZWgIlypDDrvBNjVG+W1MBU59GPbFkLGxZrecCqhhFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lHx7cz+dU6QzyK3u8AGcv4oyAqBguYG6Ao6+cEP1cP2jYSU6s
	b6/y4lC+vHUE0tcYR2PRjV0EHbmX/vZcnK6FnP1VUdpJHVAnWdcPtsA8M9/D7iKx4fR9oaaHASO
	HSN62rPoWJgjLGXU/AdXU/7+tBa9oqEU=
X-Received: by 2002:ac2:4c4e:0:b0:5bf:d063:608 with SMTP id
 2adb3069b0e04-5c1bc7bd46emr1186381e87.17.1795193585853; Fri, 20 Nov 2026
 08:53:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113072621.2285-1-gubin@cmss.chinamobile.com>
In-Reply-To: <20261113072621.2285-1-gubin@cmss.chinamobile.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 17:52:52 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jqzVYLck6ujV4jc2=Mkf-BFeCy=7dUX-FaZfZ8wMJyJg@mail.gmail.com>
X-Gm-Features: Aa3M54oXMmrxOpu8xOdOOB6acVvkJkOq-L8oVEyl4twYOeTba7QaRyxboJG3ic4
Message-ID: <CAJZ5v0jqzVYLck6ujV4jc2=Mkf-BFeCy=7dUX-FaZfZ8wMJyJg@mail.gmail.com>
Subject: Re: [PATCH] tools/thermal/tmon: propagate fscanf failure in sysfs_get_ulong()
To: Gu Bin <gubin@cmss.chinamobile.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, rdunlap@infradead.org, hemanth.selam@gmail.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:26=E2=80=AFAM Gu Bin <gubin@cmss.chinamobile.com>=
 wrote:
>
> sysfs_get_ulong() always returns 0, masking a fscanf() failure, so
> find_tzone_tp() cannot detect a malformed trip point temperature file
> and reads the uninitialized temp_ulong. The sibling sysfs_get_string()
> returns its ret.
>
> Return the fscanf() result from sysfs_get_ulong() and have
> find_tzone_tp() skip the entry when the read fails. This also makes
> the check honor the "ignore 0/invalid trip points" comment above it:
> previously a failed read left the caller-dependent stack value to the
> temp_ulong < MAX_TEMP_KC comparison, so a garbage or zero temperature
> could be counted as a valid trip point and later drawn as a bogus
> marker in the TUI thermal data window.
>
> Return 0 rather than -1 from find_tzone_tp() on the skipped entry so
> the scan_tzones() loop keeps running, avoiding the early break that
> would leak the remaining scandir() namelist entries.
>
> Fixes: 94f69966faf8 ("tools/thermal: Introduce tmon, a tool for thermal s=
ubsystem")
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>

Sashiko has feedback on this one:

https://sashiko.dev/#/patchset/20261113072621.2285-1-gubin%40cmss.chinamobi=
le.com

Please let me know what you think about it.

> ---
>  tools/thermal/tmon/sysfs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/thermal/tmon/sysfs.c b/tools/thermal/tmon/sysfs.c
> index 5d64aff12a86..7f1e38276254 100644
> --- a/tools/thermal/tmon/sysfs.c
> +++ b/tools/thermal/tmon/sysfs.c
> @@ -70,7 +70,7 @@ static int sysfs_get_ulong(char *path, char *filename, =
unsigned long *p_ulong)
>         ret =3D fscanf(fd, "%lu", p_ulong);
>         fclose(fd);
>
> -       return 0;
> +       return ret;
>  }
>
>  static int sysfs_get_string(char *path, char *filename, char *str)
> @@ -167,14 +167,15 @@ static int find_tzone_tp(char *tz_name, char *d_nam=
e, struct tz_info *tzi,
>                         int tz_id)
>  {
>         int tp_id;
> -       unsigned long temp_ulong;
> +       unsigned long temp_ulong =3D 0;
>
>         if (strstr(d_name, "trip_point") &&
>                 strstr(d_name, "temp")) {
>                 /* check if trip point temp is non-zero
>                  * ignore 0/invalid trip points
>                  */
> -               sysfs_get_ulong(tz_name, d_name, &temp_ulong);
> +               if (sysfs_get_ulong(tz_name, d_name, &temp_ulong) !=3D 1)
> +                       return 0;
>                 if (temp_ulong < MAX_TEMP_KC) {
>                         tzi->nr_trip_pts++;
>                         /* found a valid trip point */
> --
> 2.55.0.windows.3
>
>
>
>
