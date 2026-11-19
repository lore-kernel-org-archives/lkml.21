Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117028;
	b=g/0B5+VEjFgTROA9MC9AvFStJEovslNS0nWBTUufNEKVTsz8y7FV0HDGH26BkUa76E0e
	 cRUU3XRArZZ6FwSLMQsaBfwX5FLgg5R0fnCLKmDkDmiNku/BFVXanx3XT+TJmXJkMLzLl
	 p0Gfdb/EGL/wu8wyRSlwfPASJKbGa5UplppbJJE93rA8wtWEICZjb2Wk7ObQVwwin++J2
	 1DQLvsoxczT8zjxvmik7dz6NIbREKMmROrYY0pxNUHjD2Nfrr4O0AzCpuSTcvtOrCsHrI
	 hXRb/apcfuObpB8XMSoReRMD87XfaApzDQh0/q5kE93N0FJYEHsTkHx1x1sWYI3GxZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
	b=o/2t6WXSA3+NUuJgmnOvE301QDviF/HWFKrYTvRbHEX+I4lYNQNXhQKN2I8x1aOQOuCt
	 8qevg75/KBEkVjUCTwYalU7tTAMBca8syOiKwPnWwyS0t+CvUtu05Brl+63QPujUVPDcJ
	 I5i9AVTjXa1lOnw23DVMuLZasHN9liLObqQ7LmoYi0C67hUipsCeQK/+dhxmLV6s50T+e
	 cZkuV5WDSmbyFsBF+dLb3sT8u0/itbxaM/uHYHWfxfTF01S39sJ/c8RDKS6fpZpVeF9Xg
	 +BkWBEZbu2ZWtsayKUO+UmHYbBd5HyGvSa+EH3mZn/bizh2/BOU+yLtZKARdMsg4F3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2P1rliW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625A60A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4625A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2P1rliW
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so147579a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795117026; cv=none;
        d=google.com; s=arc-20260327;
        b=CDrYeys2ODjuNgWP6KAJ2yF8qU5P5ExJyBiw33CXA6uG8MVmWv5gdTMNC/u5r9223X
         xIlC5won8c1WKSFcJpF4qaOZZuxvY/hPghOW+VOoeEk2gQEYV1FPfVeURyxV8uJ6C8E4
         udK7+xuWvxGITYrJszbLWK/pixrIxQCr547oNbB16cdH7kPK9Yn0qmHZuK5zIbfRMbqt
         JgmeKpYGO2FYPy6ghytLapfUJU0g/f7pzySLbvrJ9bW3GlEo35Dy8DPHPpOv+tGwBQ4s
         6EJ0H5f3hx44k8r+lZ8StGaQ935j5sluQCnTQZos633HcXpBOdqGF3Kn/kyiJ2gf935t
         ApeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        fh=fRNMGHgIJsr+CvP/MfwWbG5ktg2yqVYQniYR06RntC4=;
        b=kEYPenGp3x3j7nS8z3WEVRuDMH3PcNX+7otEfLVgFVQPcTAeBUj/xe9fRadzcek6xJ
         8vaxdtL8qjeU23H2f/4f5y2HPg7dhDUFmW6mlxraHc+aqitaaSWpFHujsg8Htjtzdhn6
         +Vj49ERrdZaQjD5n4xnYJwGyKqhnLPeITunq3DMWMRVzoFunRvv2Y8GOp7aNe5o9FvWq
         pgYnW6w6b4wgX73P5jcbiuqyF+R76+kq1WiOwD+ggZcwmNqJHzlYQK8kpGiYxK4Qtag8
         mECcw3Y14OG/wrx9+pqfCItA9yhRfUN+7l5Q3SOy88ru9c5vfdQ1f5UeDWkDb6J47uqZ
         Boww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117026; x=1795721826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=J2P1rliWlWFeXXFXmXF+ohrZY4u8BY5guzLNIZE4zyZEFvv9XjVp6qSFQEuKBYS4gw
         tRHKICBYDX7EHD7dOjit9dYAF5zAZQoiMjaWziJZS+p8scKNzprADKCa9phj/1Tq5rLq
         AdLh58YB1IlCzIIphjpmi7F6IODiO1Lb028EXgDFuQRtiOTbHyBQqFgQJ2a9rTkXFmIk
         rIDw5jsAro28ug3nEE4pf9UY06m6dKeDy1GLSXALfX/FhKkPB24uxc9fzqALY5d5/0zY
         o3ELAOqepaHkRc8vyIjpo6spF9jSLJ5v2/RpEGLV7zg0pNxm6ebUphbxyHHPfV1Pvs4Y
         7KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117026; x=1795721826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=rXc1Q9Qv9HksK171mSQdLgukIuvHZGDvK3lBNCxwlYVdRfreSrYFJSkrXzya7likEC
         506/aqJYAfyO3fy8ruRjW/nJ+3wFpWnmmg2Zdm07nne43CQ22Zf1hzxUvlWWc8fptNRa
         19AmQKzdwaIjmEPT4Ks8BNShK5QcN0ucwUpN3Zh/nQ3nUxBgFuIsSO4anYvQglDvM6Sn
         FgR5BwIp3TtlzNP4R2FQV1w7iiqZ4iBF6qKrH7dSKzCsUPrAB7wdX+mW/Q14xz4KwmFH
         /WuaecpvrI6+eGSbSv18tmvgk3GXfR2liv5ZFYaklbnBtV1BuvVaFAQxEV6OBlh50+NO
         cPww==
X-Forwarded-Encrypted: i=1; AL+hErG8etsby5Mw6P5uqchpBWCrADeXXIg1UECmoJcvhPV9x69N2jNe4ygquOU43OcybIXaMej+ABaK/gtxdfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dNqy0Cr5Q/b6ewVmDHWtDF6uRKNo2ptyxk+tcGc2v19f7BrUr
	bvK3rsplu5sWvkj0xRwJaXpSPiI2mIMqn6meOsoCL2QLndVryr0lMwH1R0IEFjBt4u8V4MmsZDs
	naij/CiXUO7AjxDBkJW8HSaarUEvSL+Y=
X-Gm-Gg: AYBFou3eikmJ5Fn3oLwEvKTjp3CGFZpTv5n2VlaM/uO4rmgkYjOIpUPZ5Dk4AtV9K93
	OBhrVifrT1ul3zgqn8HLIkdvMapSC+DKjb2OQ/siQIvObYTb3kpdQEBOIKqI3F+TApFimlCuBGQ
	MvcOFXrKhhAenKALw619AmHSIJ5kjookq1I4Pq7gAi3wxHHlAzo9ygZqgKUlllASo2+ROJajBhJ
	KNZFm7mL96Uy0DNQn6c0dqy3JPkq5qn3KUAmxxNxeUTYQFxKw08G8IjLVmIOldZaByqtDOYUKF5
	fCr4smFrwonJbcn5bplExtxAfz/e0bL1Pl3elLbUZw4npEdTLRbE8I8QhnT30q+Mu9Azs6VZy4q
	kLBl8WXkaS10XcjDj6aOQpnCXjYDwj+gbpP5GFEEIQZblxG0ihsOO9sQ1XQ7IHwNO4Fyr4W8=
X-Received: by 2002:a05:6402:897:b0:6b8:8328:8e66 with SMTP id
 4fb4d7f45d1cf-6ba37d62a2dmr239724a12.7.1795117025446; Thu, 19 Nov 2026
 11:37:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-3-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 20:36:52 +0100
X-Gm-Features: AclHuK-9kUyGBTzq0h8pZyp8mMZSXIXsu9pOi4Bu2Y5vLjqBJOsUk2EoN70jtkI
Message-ID: <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Add fileattr_has_fsx_mask() as a helper to let filesystems check for
> unsupported xflags while allowing supported ones. Can be used in the
> same way as fileattr_has_fsx().
>
> Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  include/linux/fileattr.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 42b92ccdc583..ba7ed3b387d8 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, =
struct fsxattr __user *ufa
>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
>
> +/**
> + * fileattr_has_fsx_mask - check for extended flags/attributes
> + * @fa:                                fileattr pointer
> + * @allowed_xflags_mask:       additional xflags permitted
> + *
> + * Return: true if any attributes are present that are not represented i=
n
> + * ->flags or @allowed_xflags_mask.
> + */
> +static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
> +                                        u32 allowed_xflags_mask)
> +{
> +       return fa->fsx_valid &&
> +               ((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mas=
k)) ||
> +                fa->fsx_extsize !=3D 0 || fa->fsx_projid !=3D 0 ||
> +                fa->fsx_cowextsize !=3D 0);
> +}
> +

Every patch in your series did:

       if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;

       if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
               return -EOPNOTSUPP;

It looks like this helper is not as helpful as it could have been
and you have raised this question yourself in the cover letter.

Effectively every filesystem that supports fileattr_set() already has
a defined SUPPORTED mask, so I think it's better to do the negated
something like:

static inline bool fileattr_supported_fsx_mask(const struct file_kattr *fa,
                                               u32 supported)
{
        if (!fa->fsx_valid)
                return true;
        if ((fa->fsx_xflags | fa->fsx_xflags_mask) & ~supported)
                return false;
        if (fa->fsx_extsize &&
            !(supported & (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT)))
                return false;
        if (fa->fsx_cowextsize && !(supported & FS_XFLAG_COWEXTSIZE))
                return false;
        if (fa->fsx_projid && !(supported & FS_XFLAG_PROJID))
                return false;
        return true;
}


...

       if (!fileattr_supported_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;


>  /**
>   * fileattr_has_fsx - check for extended flags/attributes
>   * @fa:                fileattr pointer
> @@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 fla=
gs);
>   */
>  static inline bool fileattr_has_fsx(const struct file_kattr *fa)
>  {
> -       return fa->fsx_valid &&
> -               ((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize !=
=3D 0 ||
> -                fa->fsx_projid !=3D 0 || fa->fsx_cowextsize !=3D 0);
> +       return fileattr_has_fsx_mask(fa, 0);

            return !fileattr_supported_fsx_mask(fa, FS_XFLAG_COMMON);

I hope I got this right.

Thanks,
Amir.
