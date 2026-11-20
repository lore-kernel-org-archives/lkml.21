Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195859;
	b=N+y9ayH11FjuTAjykwvZm6eNjKVLZBN0y+zzyAoDKvhpvtvxsSi9haBG9ZyY5ldfgcoe
	 80G0nwFvW3GjuH0c11jYlxT9aIJ1lJVO4mj1rNWkJQO6qfVwwFQLRavGq1yx1hSv4Hq6o
	 mZySvi2m312ewU4RB0x4EYvOWukdNfRwhd+rSmj2qjpxKXfkmO7ZwQGPxWo4RvCQ8uNXM
	 QcaRSWQHOIWomOss2jIyfZrZ3xmk35zaNuNcgY3oLaypc+Ya0DsvzOKHQf+Jvp7V3a5is
	 tZxCB9LyUbw0mYS8fl5JzoMZGpfjWFZwcPiPqJ+T4k4j9Vp2zKzDoelSAd3zK0RSLyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
	b=oN2/uBvA0v168U+5VX/6HLgiSgf/FNNwjEallG0yngDNPr2OxZQUBKk2lNWa57GtAdfb
	 FEzqIVmPo1WoSEbvF6SuwuTjiejqz+QmoP9Os1q3fEa1Zs/MlGNc4EmTmpTUK9kzL8URx
	 ba5TvUMQGMKQbvrZ6zJSagbG3RhQr5XgEd3nrm5OZpzDIyAMkJ22SilK75pMjENwECEZi
	 hZ3yrndNnMfy6nbfSBWjIfEEXsJvlAnmGSlzHJ4voWHScfhQKVk7mxMv7BVp1lyk750i+
	 jfRRDycB0Lw0QV0b1pXTwZKcoy0xA/j2PlnKVvJwugE8PeDwthRG4b+MmyfdRwX0rFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.cmu.edu;
	spf=pass smtp.mailfrom=andrew.cmu.edu;
	dkim=pass header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=hVD2xIA8;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928160A2620
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7928160A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=hVD2xIA8
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c304f7031so13455791cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1795195855; x=1795800655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
        b=hVD2xIA8/rREyHY9Si7a/qw5Wd8nD0YUGombNk2V2ydWCXhxEPqJ7vR5Tn+rU1D2Vi
         tglykETYBfX6JkCKFNvnZ67IBYNwP7vfbSrTpXpDYto9iW6YunV3R00FWywjtCuBfpbL
         Z2S3t3dAY4GnD52x86KSRhe2JtD6ZkOLhHlwHCbizeuEjrfimHUtCh4CcaRzfTMq76VA
         1/2ViFygRU6O0lb3hVV8cJS9ZFBo2P4DYDtBrHpvhekegZXywFK/PmxgMLoszf7vuvXy
         zxVc4VYZ/DO8CYBKKw0+iIIA+mdlzp2pc8xh+v2rKB8VMaDlp31arkDZJMXoAfidkhax
         8ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195855; x=1795800655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
        b=Y41ISKP6vEKRDPxg19kEtOe+kSfIsXSW5WHLoI9TX4aCV3L13zyTZuHE7/jH5qpFE2
         W8rtvXTHdr8e/bdpfTQrcb5JoQZyE+YfIecCdcdUghb6UeV2eFLlWRkenyWQ+U7X1Kk2
         axc8WfqV5cI9N9xQVRSdS3oSTGcirdcbL5rwM3iXvM2zAomqsOoRcVrP/R+ncJg+2/8r
         ijmVaRmFClNSS+CyNTiNWBVrcFsxhfXJm1mV5HpYGFPWtTJr+JdyE2okT6TLoEMI3GIa
         VjWeh6ipFnhvby4IhT+oK0wk0NSMOFFKYWxBGxjlImEYt5cqUPfQx3P1Bd6rS6CTor3T
         5czw==
X-Forwarded-Encrypted: i=1; AL+hErFbStK1ODe+Y2NLliErJKmo3IvKvgqGQk3opv/Ee9eBjcXeq2ddDhETW47b7ULe8vlcAK6QTUld5kalWTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z95SuFuR0c7viI4ZyKz+lYcFUN4v1rbiHaWeRF1gIQpSzAv5QcH
	82HF+t2+qEvpeZ9un9RXXOr7cYy5jQ4on8+Egm8DG3GfVPgV0AFljIr0avFJ920Fx2HN6EHno9x
	wdOAdVdQI
X-Gm-Gg: AYBFou0u5Whp55N/LRT1xytdk85u6H7mjK6a/VHYvgmI1TsjYxc4YBopTb6AmWxTMH+
	5pfX4q3duvpoyTrbuhZBYWMZqipN3grQ48UUYCcxRQZXXe1XcNlH7ecV4gjCcOJfxa50GHTXtTv
	AzwVdPEjn+T/SBAuVXB7/hkic491LKXWPNAsP3oVQRI/yBNh+AVhwPFpNAWHYoxzZK85mS0LEqI
	cueW5cvTu0Qw5SfJ/ezl4er2VRrEKzbsOTUu2f+noGohXjXMW6vQYtJeNzuMWXr0+/I7ZrsEEXD
	PSEilFkqAzGNGj4HeH/T40v5EA900V4NPGp+0dNbXbfAVHQb1aLSPPr1l7anHPIidfuBkE5uR2F
	VGCxMEWsCBUytbUiiThq99JVy9EBk1u8RWTWi2KZS8ampbYLU6F+bg03khanpe0nB8Q6emysr6F
	E6mPcgLuuS+xvpXSMgrPoFWcLmDEkfrdq6KjfT4rIaAYC5HHbxNYUoRN3wA7hfNS+lp8VOHEche
	eDV1V6Iz0HRA395O/jtw9f7u7o0ri4LFfExPALHZngWjXnRmiwylc3e+ZE0anr+gIV9vAJ6F2yd
	Z3y6XjrezxspJ50pcsRBmuNcvXt1VHq2kiE6gW9C5JoFzSMotqQ=
X-Received: by 2002:ac8:5d0e:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-55d769fe4ddmr65344931cf.14.1795195855134;
        Fri, 20 Nov 2026 09:30:55 -0800 (PST)
Received: from cs.cmu.edu (tempest.elijah.cs.cmu.edu. [128.2.210.10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm28152341cf.13.2026.11.20.09.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:30:54 -0800 (PST)
Date: Fri, 20 Nov 2026 12:30:41 -0500
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 2/4] coda: don't d_drop() early.
Message-ID: <20261120173041.bd3xeidt4ndkmimd@cs.cmu.edu>
Mail-Followup-To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
References: <20261117000115.1433875-1-neilb@ownmail.net>
 <20261117000115.1433875-3-neilb@ownmail.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117000115.1433875-3-neilb@ownmail.net>

On Mon, Nov 16, 2026 at 07:09:14PM -0500, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> Proposed locking changes will mean that calling d_drop() could
> effectively unlock the name allowing a parallel lookup to proceed.
> For this reason it should only be called *after* the attempt to create a
> symlink (in this case) has completed (whether successfully or not).
> 
> So move the d_drop() to after the venus_symlink() call.
> 
> Doing this also means that if the upcall that handles venus_symlink()
> happens to look up the name being created, it will get -ENOENT rather
> then a possible deadlock.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

Acked-by: Jan Harkes <jaharkes@cs.cmu.edu>

I was sort of already assuming that the userspace cache manager should
never ever traverse into the mounted /coda file system tree because
there is only a finite pool of worker threads. But it is good to know
that this change would fix at least one possible deadlock.

> ---
>  fs/coda/dir.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/coda/dir.c b/fs/coda/dir.c
> index a85be5962e62..b47299527b65 100644
> --- a/fs/coda/dir.c
> +++ b/fs/coda/dir.c
> @@ -249,13 +249,13 @@ static int coda_symlink(const struct mnt_idmap *idmap,
>  	if (symlen > CODA_MAXPATHLEN)
>  		return -ENAMETOOLONG;
>  
> +	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> +			      symname, symlen);
>  	/*
> -	 * This entry is now negative. Since we do not create
> +	 * This entry is still negative. Since we did not create
>  	 * an inode for the entry we have to drop it.
>  	 */
>  	d_drop(de);
> -	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> -			      symname, symlen);
>  
>  	/* mtime is no good anymore */
>  	if (!error)
> -- 
> 2.50.0.107.gf914562f5916.dirty
> 
