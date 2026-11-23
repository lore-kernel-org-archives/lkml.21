Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438860;
	b=gLajtgVKDvKs2KdkPUeDwkoHqHkgYZzgqnV1ThaLAdIVEEzRVzpPniHNORbhBMPv9vy5
	 DlRzRJ6vXwww4sLbMx1SVpv/0WclagU6qpZs0ABzQ/8Nahy89fYZZ1sYFP3BxIThy4fbJ
	 AnwSS8XDVRlXgbm9Bfn98xpwwBpovmTWWizRySQ4Xc7kO9RyMra6yM/U9izmMlxbNA7th
	 dbI+TBRPTgM4d0W5QsRmam35ufWwKzb5N/hkY3oM7pksvKwPmsSmKLHWEwOugto83p1a6
	 suo6x6VY8XOYCjP8W1IDEFoUV12+NH+S7TCTDUs2/Shv2tugKloSLHu16KEEsiZr0sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
	b=af8qrGu8K9uUVddKaHMc+4Xk0FDfeLOPmY9hkch4WYCqA8L7R2jd+JI4Zdmcht/34Ew3
	 N4rY3Twscn9eyVYIkLWRb9RCmNF30c0v/EG0ELXJY3YJ4a31U8Xe8st3mFbBz+NfXjSlc
	 49mfNzA4ZFCDZel1kzcxlLA6/wmh4TjH8l9pQ9H+2miF0irg4O+jHVwNn1YUwyhLvo7zg
	 qOcR6rZoP/sDBuK1b8iJDO4yNLkiZARrLoFbiD29PxWzzbcnz/JjHpynXPcH2Ob3l/xA3
	 2rsiixEWP/Dej52w63ct8i2QjwvUcxozm3as0kY7uVQfwKepWfV4uNHIZnMNMsdd9Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkson++k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A346606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A346606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkson++k
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so1399507a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438857; cv=none;
        d=google.com; s=arc-20260327;
        b=bNyv6dtXRRLZ2fpDHjf0DKVKG0ogIKOv4qWiOZzaNyMWF/qsrMVjr0H9eFaZPyQEV0
         I30rN5Amx99huyqidA2zMPZIecdarls6ZDQnxpWrbVGGgER9RK0UGI83LUFr2symiscs
         i2VwnpyNNZqR0WOqDTvzAL9v4qgYa/J8EYy9GezAL15gaQGemXX4iCmaiVs2gftYIsgu
         1xIC605lqJI0Y2/WIO8dDT045YMrhBTBLN+V3OVJYbrm0qWVtJrSwjmSpQocOcpoVkqK
         ejJXd/5EWpqJih+90dJKTaHbrf0Ie4MXF/jIqGDbaD8QePY24m4F5avTwAH5t9QwnI48
         2WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        fh=MgwaafcZySsOyF8x700KseG3kpd6mzmm5G/hh86NKwo=;
        b=k/+dlPYe70HTn9s7MnpXqoyg0TNL6KYc9AE18VLtsnOnnTq1Zz+1Yvexkn2o/kZz6K
         xuo8BgdJmXbfyJcxEWqHSxBOtC4uJAvJO0inq3AHnZn5HUnBFJPqsGqb5aLRb/0K6eDk
         tOdu0/IPLC66uA59xC+6hv5nvtqiO1Q+7tukFlKo5cGMDIPAPAmtr5Bp/g2FMKuQQlab
         FaKC1IWvdAYQIUnt4nN9Z3GEQMAVmSNXT6BAhrvb6DpFcococoRNxXqVNZbf4j5YS7Sj
         LnTI3yp2DQerUIBemRMpspTxk0VYSvPIY4az/9vG+cHou3M/seMOrFpNMBpVieqLfxEk
         9kWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438857; x=1796043657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        b=kkson++kiVuuq7GlVJEDUrQHu19KcH/nihH2BzgLa6gbrvy17AZmxY1D1w0dt2h46y
         /xXI9YCF3W8v6AnWEDT8Xid0rKVtto9xbQeFZkRGR+cb5Y8RIC0oMxupLBYaYJC4CQou
         6ZJgLzs7wocf6G/7L1QJdpNwS2lbDAistHwZiRuhKs46qZQI5UTzUa+r+vixCZl4Sxxv
         NpVQv5tq4rxjVYt/Ok4zCR0OsxODa6kreqGz8wEkn4nw5GUASkqE6hP4ExSDLRPowFf2
         0zimep72RFU7EbpYHdPGxIgrdpvUiN+7UnUUrPJ6dRIQHj227oDE5EmUxVXBkiebQasL
         M4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438857; x=1796043657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        b=UwJUcChnJFJftSXVjfGX1E0FM97R1VxQSCAFwHhOmkOc6UhbObBn6QAnwcQC7dnKES
         cudPV5H5mqLdG26n3hTBmbMQe5yfMWjfTQoQlnEG2NtOqOfJEZw1CVVAOflYpEYdRJwh
         /19yKcZgS2IYKwE0HBLVVK5B5RhF6ZOQgL2kLz4EKUyuI/owg/qhhczj9e4K/quBFatw
         xoBWMK1H8arUcnDUOWPUPP4LGDEAChvoL5W7ey43+VWB5KmowS8I82rAUqPssPFgzUY6
         2yHp9CbgbmaZx0H0XPwa5m43CMDM6cvLW56oW7Awt0U7pG+/2hC7mqOhLnKlmkN6cZHu
         q0zg==
X-Forwarded-Encrypted: i=1; AL+hErFnEqdSuj+l7RQlMAKH1hX2d3oRzC+1dD3pnaqOmfaIYROudqea9I6mHYT29/aCkNPkhMzva6dtTMMVRu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H96sIpUVzOocG2mMmodHfgpwhtPl44KAd7BsZCaR48Y8tCSoi
	F6T8Z78NhXWMXcxybzbo8GTarlEQz4ICfWZLMhz5qIycyFJrBUQZWEBMCGLbQ2Wactg5t52Heb6
	iiKx7QOesgZURDF4FIrZw3tfYRzsrxzw=
X-Gm-Gg: AZFdTZdV/9vCRt3KgDtnj3E1mPcSEeralsFOABFqRJMhggQ0R0nykEhVZqyu8eFJ3eN
	fWZyjMo4q6Y8Iqi3vA1/hcVte4EBAjlDx5IAViJD07k3gstA+yS3tdQgzz5zvXIsFx5OOCzpsao
	4/luQaAdq9qGEF3uhVepe1TFs98xSvMQHA8MOKS9c4OiT0PjKowBxWZYwYQjsj4Jg5WO5PkqxmP
	R9SY2gUCDo8VjvxmpcCnfjgEeRbM67cFfKDODL464YYfc/nwWsK7cuQ8Qg5EaN2Bo/H1ewIaDpU
	GW+UCAcz1n6eOL/qojf421nVtQ/3xtD1F7did+nP1meDdZIVZXj8YSL+q1/fd0WzeG9LpHx8dyR
	Qde6UXMiCti4lfKpMeV/GlA1xlss3CpNY0VY2WnwJb2mYfM1OTlo1uiYtXwTaM9gmUX+2og==
X-Received: by 2002:a05:6402:501d:b0:6ba:659c:8ca3 with SMTP id
 4fb4d7f45d1cf-6ba659c8fb1mr5474446a12.10.1795438857096; Mon, 23 Nov 2026
 05:00:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-4-koray.fra@gmail.com>
In-Reply-To: <20261122000856.536902-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 14:00:44 +0100
X-Gm-Features: Aa3M54oIZEz33KQbWl8M_WOYBLraeDplxcWm8_8Bl8KeH9NFv_L8S3OGX6_s9I0
Message-ID: <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> modern xflags (FS_XFLAG_*) fileattr API with masks.
>
> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
> FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL)
> to be used in this API switch.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c           |  8 +++++
>  fs/ntfs/file.c           | 63 +++++++++++++++++++---------------------
>  include/linux/fileattr.h |  6 ++--
>  include/uapi/linux/fs.h  |  2 ++
>  4 files changed, 44 insertions(+), 35 deletions(-)
>
...

> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 50be49f4c913..fde6fb2fe39c 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct file=
 *filp)
>   * @dentry: dentry to report the flags of
>   * @fa: filled in with the flags of @dentry
>   */
> +#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_CAS=
EFOLD)
> +#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> +                       FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)

Nit: checkpatch may allow 100 chars, but this due formatting is not
easy on the eyes
pls break to RO line and indent the broken lines below (


> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 4faa40febf11..219e7c8eb601 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -7,12 +7,14 @@
>  #define FS_COMMON_FL \
>         (FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
>          FS_NODUMP_FL | FS_NOATIME_FL | FS_DAX_FL | \
> -        FS_PROJINHERIT_FL | FS_VERITY_FL)
> +        FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
> +        FS_ENCRYPT_FL)
>
>  #define FS_XFLAG_COMMON \
>         (FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
>          FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
> -        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
> +        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
> +        FS_XFLAG_ENCRYPT)


Rule:

You cannot add a flag to common without carefully auditing all
filesystems that support the legacy flag.

FS_XFLAG_ENCRYPT can go into common but must also
go to FS_XFLAG_RDONLY_MASK because it's read-only for
all existing fs.

COMPR is rw for some fs and ro for others.
As with CASEFOLD, you cannot make it COMMON before
converting all casefold fs to new API so that each can say
whether it wants RO or RW.

I think there may be a way to deal with this easily since
ntfs doesn't need to set either but not sure.

>
>  /* Read-only inode flags */
>  #define FS_XFLAG_RDONLY_MASK \
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index e40806b3a69c..09fc7e066485 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -275,6 +275,8 @@ struct file_attr {
>  #define FS_XFLAG_CASENONPRESERVING 0x00080000  /* case not preserved */
>
>  #define FS_XFLAG_PROJID                0x00100000      /* project ID */
> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */
> +#define FS_XFLAG_ENCRYPT       0x00400000      /* Encrypted file */

This is a mistake of patch 1. the newline should remain above HASATTR
which is allocated from the end.


>  #define FS_XFLAG_HASATTR       0x80000000      /* no DIFLAG for this   *=
/
>
>  /* the read-only stuff doesn't really belong here, but any other place i=
s

Thanks,
Amir.
>
