Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598000;
	b=dJpAc1NXk9MRy6IjV7R/8m1JM5DM/eJ9rLL8tdQlzlwKvOCM8e84aUF9VG328YMUSsKn
	 HqwfQxKgYJA+cX3KJxM1KHm0srnOqFJtl4nKUToSJioID1CtoPeZBzDVIaBjLsLP0dPeL
	 VUZTKKaiZMB53NS7SoEw5HEwxgDCYCsZSjnUZAe2edx2DGlMx56OLr+uP1IiDZPpg7x1e
	 4m+70n9tXqdaMAFm4JB241zhDnn9teVcYQjnbmMZh6YRv1gsNL0YqECiCSGnPuBtGyyGu
	 ib9QgPNEe6BtnhebND30dL3jPmqDCUeFL7gxCC52hTuqzK42mvVf1+xdguHMWLV5MDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
	b=kZTRvZkvH8qKFi4NIUBhIpDK/w+ZwvovW1ep2N9eN7ouuYhAr/jQ3jGdyfLsGpqjJ2zx
	 koYxT2SP/iNpLefY3Mpfth7xN3gcHfypXLecRnrXPT85l/j1Tjdtd0mBHqb/rFJK9Tnko
	 /b7aCKXneI73rIhvdTiL53PRal9GiX8r7IAfKxDdaN0gy0o8kp7ch3CQHRuXMsQDtTMex
	 zMmD5rjKKXQyriTJavy0qUEuYJ7FAdIBlFI+GrTDrZRDG8PTxNYJ9pyqTU2imKF3VzA+S
	 1SqkKcj1cMy+ULXuhlZhWYX8qKmZeWYn1PCs3lWgi5icjOAwiyB8WNszgqxkdQSY1tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QanoSIHQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F224606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F224606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QanoSIHQ
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53664b4860bso62191361cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597998; cv=none;
        d=google.com; s=arc-20260327;
        b=o6n4/lOL14hl5csPQNgmDIPZ8MnOdh8/8kWWIyef2UFt9eEPBUYu3PaFq+yh4fGkUm
         5+G0vh2nZB2rYtQEWoHc81GnBHnnbftWr+PbBEtMuCzedudAXu5pR7/pgRCk0ZxUQpZo
         QHnlHSjnJ2ROiidPu9YINLMjSU5YJIhJwrWABQ6sSl8A0RZ34GQgcPYjPIaVZlgHHTtL
         5K7E7roqnclqSaqQ11ZnJcZPk+/Rj9Oj/udBupGul/DHRr+/7QfouEUtyT5TGEugf9J2
         GJ7qQy+Bg4tZxbA9rj4+Z9NhSKTmtH0wsgr8N+7tw0UPBScEsOCjEz3LdEZW19CL+dSZ
         JLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        fh=AVWkxlnMabHzR0V13/tuM040JO98j4OPim9l5nD064k=;
        b=ce+OWrJkfBuK2BvGfdzZqFifXQyh9bEXevn3XTduZq965lTtgjike1srMPdvMWUwAy
         kjs15KIdDowAhQsVJ3Jz1DaA3Th/c1mQv34Q9wdlquh+3NDjE9jI26mPvDOa0Nf/kpk9
         tQFBgRtrqfwll7dIRtZodbS2XW12T8Khq4XvzJpl0GSjYzxUmNUjRSjn/XwUGFJdhXvz
         VZMiEpjs2YIZZJ6ivxU+YDquXxlJt3U7JcjYm+QmZSd65zT/4LyosrrybGfZaGUA+2k7
         RxWtnm30QtFfd/dJOoNB9UQHigoxg1/SJjJglplwroJK/HhzjpmVUY/PAsUcTZoXep37
         ftGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597998; x=1796202798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        b=QanoSIHQuHTgrvbiASo294EDkHUXZKrVlsMQ8TEnT+EhG6UNfxC9nx6JKAu+DV/Vk+
         vXujk0OdDz/f8ra4WXsyPAcKRGrRKwVurk7qORrPJVg8gF2vv/V2K0TwN04YucUNxc7F
         iOga1bTaEdgnZTs1cQeubbJ66yGm2dtv9Jwl+KGdwqY9P98TkWuu+OAPdu6Qz3syq3j7
         X0yZ2AeQFTRrwiu5Py7cTTLPgCN5gLi6BwUMkXYDGiTgKjkpE5nV6ADw5qCbEZn3IXXI
         c+POL/L4cEhyj2WGn08V0WpFZExp0mSlZUp24PcR9I5kP2U71ZFZ/ZEdWRvbQfQnJKEj
         iIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597998; x=1796202798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        b=dLsrVoSe6+xEO713a4KsjxZx8V8WjgL7zttG6hJCc1kVW1nOxIaXSAo+4oF3dY6HCm
         CceY9vc+3+3KI9uLLGllf85nsrbC9eDejDOyZBpbG9vjThh7NWZgJVWWEj+yXUKlt154
         yj+z9I4CHM0Xp3487K71adQNXg30pqSWDlOusmyPjGnZ/8EQKYoHfYTXAFbEhwHskkVf
         MsQxfOCU+DKkck2V8F8AaCPNjZYTVyGJuyKL9bIFXjABPmEbUfbNDMAxzXHNy20KWpHg
         hvvgZQM+sGq6nD4FVKgCg0ZPnzjkWQj0oFCk0z8HQ0CAT61v9tlCR5fA4xyTao7z0G6i
         CUgg==
X-Forwarded-Encrypted: i=1; AL+hErHEU5v1BHDt+1lLMF2SO3jcZeqj9Cdj+fMORGDzXpCzDy1sIGwjXM093t/ugnX9YO+rmWNhs4FW3nBKU4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fXb40yqCgq56kvMrBoVj1q/WvAMgyyaVdhr1VyqXxBX08VbAG
	C3I84wbzslSbtmgG8wJ/fZR7nCosupncTLRYn5z95nmjen8Vfzm4iRnHouTwi+HfYZ9tdXX9RF1
	Jz0n6HshrHy/FbIkS34seym6ODPqx1mU=
X-Gm-Gg: AZFdTZfKTUleJ9AGfyeZ/GSe60CKi9wfDM4kbfusVGb+rYyN1c6eLyqvx7+yG+9Mp51
	F6yjmfgkRAJw+Ae3OinJkLjGRY+YLZZSfWjD6lTs1acIV6Bwhr8ME9pQt+QV4PXCqTFUO1ag0hz
	/eDuEM+In0qoeY7uPsIX+QetEr1J+ezOjfAwsvkygEY3Mk1rW76T1mr1NntwQn48lVwqghqVMSq
	LrhHuUPVdfuo8COGgYT/vOia3Ywyw24G5aT9lwmy9/pV+s4bN9ITZcRVHvJTwzJFUae0eT2QYgI
	9XU0JCUY/ShIMUJ48gYCxsRuw3Lx3RTr59C6sd94N2HuEeKzTWVjoX065nMBGrjaWoVubF/WR7/
	9Eu/RDyA6xB5hK+dTZt10358Nhaq0KU83sjBEfw==
X-Received: by 2002:a05:622b:283:10b0:55d:846f:ca79 with SMTP id
 d75a77b69052e-55d846fd63dmr196434691cf.55.1795597998017; Wed, 25 Nov 2026
 01:13:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795426787.git.caoruide123@gmail.com> <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
 <2026112301-jingle-multiply-c72d@gregkh>
In-Reply-To: <2026112301-jingle-multiply-c72d@gregkh>
From: Ruide Cao <caoruide123@gmail.com>
Date: Wed, 25 Nov 2026 17:13:08 +0800
X-Gm-Features: Aa3M54o65lMpJ4o_dEHDRpARkVHBRUf-4JdPMQgcl94JF9PJoJIOfS7VpbR3FMU
Message-ID: <CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nMSxYQ@mail.gmail.com>
Subject: Re: [PATCH driver-core 1/1] kobject: reserve an envp slot for the terminator
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ren Wei <weir@nebusec.ai>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rafael@kernel.org, dakr@kernel.org, 
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

You are right to be suspicious of this one, thanks. v1 was not good
enough: the "- 1" lowers the limit for every uevent from 64 to 63,
including events that never go near the usermode helper. In testing,
a currently valid 64-variable event was rejected (with the "too many
keys" WARN) on v1, on both the helper and the netlink-only path.

The underlying bug is still real: when env->envp[] is completely full
there is no slot left for the NULL terminator, so with
CONFIG_UEVENT_HELPER the helper's envp is not terminated and
kernel_execve() walks past the array (KASAN: strnlen <-
copy_string_kernel <- kernel_execve, then panic).

v2 keeps the 64-variable capacity and instead adds one dedicated
terminator slot (envp[UEVENT_NUM_ENVP + 1]), writes NULL after every
successful add_uevent_var(), and also after zap_modalias_env() drops
MODALIAS. struct kobj_uevent_env is kernel-internal, so the only
visible change is 8 bytes.

Tested on 7.4-rc4 (b6a9fa34ce41) in x86 QEMU, 2 GB RAM, KASAN,
CONFIG_UEVENT_HELPER=3Dy, systemd-udevd 257:
 - unpatched: reproducer triggers the KASAN report above
 - v2: no crash, no WARN
 - exactly 64 variables: helper receives all 64 followed by NULL;
   netlink-only delivery unchanged; the 65th variable is rejected
   as before
 - boot + udevadm trigger/settle, virtio_net unbind/bind: no
   "too many keys" in dmesg
 - unbind with the helper enabled (MODALIAS removal path): envp
   stays NULL-terminated

v2 is here: https://lore.kernel.org/all/39d1eae0d7c8b235f5d4b68d94205b70832=
ab786.1795506878.git.caoruide123@gmail.com/

You mentioned this "simple" change caused problems before. I found
7eff2e7a8b65, which reserved a terminator slot, but if you meant
another earlier attempt, could you point me to it so I can make sure
v2 does not repeat it?

thanks,
Ruide

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=B8=80 20:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 23, 2026 at 08:16:37PM +0800, Ren Wei wrote:
> > From: Ruide Cao <caoruide123@gmail.com>
> >
> > add_uevent_var() currently allows envp_idx to reach ARRAY_SIZE(envp).
> > This fills the final pointer slot without leaving room for the NULL
> > terminator expected by usermode helper consumers.
> >
> > A synthetic uevent can supply enough variables to make this happen.
> > When CONFIG_UEVENT_HELPER is enabled, kernel_execve() then scans beyond
> > the array while counting the environment and may dereference arbitrary
> > data as a string pointer.
> >
> > Reserve the final slot so an environment is always terminated.
> >
> > Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struc=
t")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> > Signed-off-by: Ren Wei <weir@nebusec.ai>
> > ---
> >  lib/kobject_uevent.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> > index 1d29378d4f55..f7aa67d6ee54 100644
> > --- a/lib/kobject_uevent.c
> > +++ b/lib/kobject_uevent.c
> > @@ -673,7 +673,7 @@ int add_uevent_var(struct kobj_uevent_env *env, con=
st char *format, ...)
> >       va_list args;
> >       int len;
> >
> > -     if (env->envp_idx >=3D ARRAY_SIZE(env->envp)) {
> > +     if (env->envp_idx >=3D ARRAY_SIZE(env->envp) - 1) {
> >               WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
> >               return -ENOMEM;
> >       }
>
> As "simple" as this looks, I think there's been problems with it in the
> past.  Have you tested this?
>
> thanks,
>
> greg k-h
