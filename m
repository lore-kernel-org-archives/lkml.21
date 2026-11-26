Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658471;
	b=UoA9/GGkrhWzAr8AfYNHL3foZIfi+pPBz1hGzfhsXOJs+cEk1DLoMlAS6jN2U6BvvSxQ
	 +t26sv269lxT+/rEIo4BVc4/qyaxmHOfy+BwhAdegE3V5nd/iIxFoAKjRWknntXS1czdp
	 U1XUVyk/oL6M1NoxG9Rk+0YhYBZmCa/KovTH1fjqJSa9UFNfv3FqgYF3offLFx2hh/CiN
	 RCTLe6mEGjZJdqoQvp15YrnNVbPTRV75J/5L1CGAvDIQ7hJBZnib3/Ov5DMuxp8DxMaIX
	 AY3RjeKEJhShHrDeCfjEP8STa44pkI6prCYPJUVRTLMqBK1WpQvdQdmdGV62IQ1ZTFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
	b=jvjB5chiAuj470lMvFW1BULxQNc2ezTPw8KT/k2LRSkO0vx3KxRDPaoX5GivzVhiohHW
	 lTR30AX+oFeFWCMsKRPBSGS0Klq7FiX4s5KG8vUYIb+z0HDsk2Ky22desrbggfVguZVj4
	 BX2MdJfoRCoJaQoWy83kDiHz6AnaNj0KHAB+yaDSIHzg9Qy4zg7mf6/fBXN/HNn9YwYma
	 uhqRne/MVRJtf8rCRILtidFo3SbxpBOfRkcTyKheeunzRuauYsNQ1ehZFzL6LLu/U2gYA
	 1aumMbP1dFFcdEDV82Cx03rjbZ5r584ObUK14yaqEYNp7yAtp2vsLxUvHCo6WG1XVvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHpbrxkV;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2923606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2923606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHpbrxkV
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3915465a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795658470; x=1796263270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
        b=uHpbrxkV5mu346yeO2eEeutpMuZUMufGBrpF+ekNF6qVjJYbXQ/M0+hECOvjc2ydLr
         6scqFrRXYZEISd0rIspxUXV/dJUVPGGfHzAzGaFEEl8IGRRFXQk8/CcyLUY35DcxYcz6
         nwsZ0we98nABM+5cP+f2NWZdK/amgIqMJvUlUtvLtfQcKXGzIMnTl1EQv0gO+k45ttt4
         QG/Y3i5XvP6vJXxFdvA8yOYns37+bOuv6TtYiF/xRjoiPswMYvzYIV71MAztjXKp8njU
         1Y6JCVIB1RnhIzHmRtyfNAyhihulxVmFn2eogPAZV0QXXmBHBO1H3J1IqqaX5GgBhYdz
         Ki8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658470; x=1796263270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
        b=Xj86pd1sZRy80TXqv8raELSJnOCUTMnH/JE+XmTJe3lFN6NYihffguPMuJJikp9pIw
         hog/BIw765WfLKBPRefC73RPbxIriarvPRYzxh/916VJLIYrP1AjXb7tfzkMKS97e9zA
         FlbgO9ay9Oetv6h3kbsQeXY49AJSGrR+sewyw+gM7oneZCuHgCcUZSwG1dJSAgRVFVak
         hSQeBsICkQFwMaHjrvvb6MCMdEDo5nRObpSXTzJRcvydsKxbc3ydES57vtTWLYlW+4bh
         p7jZAC+VN0DDvrC5OcoQWFi8lhEy+MvB/WCNjOohe1aP+65is3vFha7DQiqQlf5klQtq
         RlVA==
X-Forwarded-Encrypted: i=1; AL+hErF73CIhJaArKGUucb2RyA67S0vdVYADp7QK6cSXBBHaj7ru48zmIFnJRAEfh1jTlcOnB6GMaHLftwuMJ/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9OmJamochAJ03qW6qILdWKczF/XdCaN6gH4o/OVDEbxwbGSws
	DRHdOFsYqtNpDReXCKnrNWG93Tx1tPqK2aMERfeuKqYrIRL4t7y3rnUA
X-Gm-Gg: AZFdTZdh22C5VuloWNR+SsjCcSJtBUyumnFx7/17O1BncM+ovdiVznnTT0mz0+B/QMt
	XMROAU3qdoGT2Yy9uYCIbXid0GKnfssX7nzPh82m6Yw5f30zFwwXZTXyffeXsrk3HJot1YMH/XX
	2Dl2KtITfvxBe9XNBqNf18Bl/7IWex1u1abfHJ4mkxRmWjo2dL9cPrhWz05CoRSbP8DB67bbDu5
	SjsSRbfX3gNvVbjcEztNjBgVuDLZRg2WtxWZA8Jqlji8Xl5IQe5h2/iRbOd7QZBpB4uOeBOOB8g
	9KjF4pcKaS9CBpKFaBgZi2Cr//7O+t6zCdLOPauIqmdU1/qLGn8/0IqlJ+FQhhyNmQiJRvRIwZe
	nKk2N2X3TQqJGXSXUpqMG++qWfHAG6c2Ps5T5vWynwUbOF++DKOHxLOWprpvc6bzHFleY/ihYSb
	Yd92fPsVxZViUtzSCVhmzJxh1EumnuA5HHHbP6VisGYx5UrldK9q4sa1VuNKyN34g0SIgwf63/t
	hIWdI66RzO6rWsbPVj/u/0YtSvQvJLzD9sHrSoUZ+sUSR3ra4MWEK+iPWNpyWgAEI77mU8d5+dc
	TKC4P8UwiqJ/OfaoyqGiDGLsUagUxIWR7a3xg287
X-Received: by 2002:a17:90b:3b49:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b41c9beaefmr19757865a91.67.1795658469904;
        Wed, 25 Nov 2026 18:01:09 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm35245361a91.8.2026.11.25.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:01:09 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: keep i_size of a directory equal to its index root
Message-ID: <aweS4uqvdtATt2gm@hyunchul-PC02>
References: <20261125-ntfs-01-v1@snowrabbit.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-ntfs-01-v1@snowrabbit.org>

Hi Showta,

> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index fe2a79b..73c8e6f 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -1434,6 +1434,8 @@ retry:
>  		icx->idx_ni->data_size = ix_root_size;
>  		icx->idx_ni->initialized_size = ix_root_size;
>  		icx->idx_ni->allocated_size = (ix_root_size + 7) & ~7;
> +		/* As ntfs_ir_truncate() does; i_size kept the old length. */

Could you remove this comment?

> @@ -611,6 +611,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
>  		err = ntfs_attr_open(ni, AT_INDEX_ROOT, I30, 4);
>  		if (err)
>  			goto err_out;
> +		/*
> +		 * ntfs_attr_open() sets data_size to the length of the new
> +		 * $INDEX_ROOT, as ntfs_read_locked_inode() does with i_size
> +		 * too.  i_size stayed at the 0 set above, so stat() gave 0
> +		 * until the directory was read back from disk.
> +		 */

Please remove this one as well.

> +		i_size_write(vi, ni->data_size);
>  	} else {
>  		/* Add DATA attribute to inode. */
>  		err = ntfs_attr_add(ni, AT_DATA, AT_UNNAMED, 0, NULL, 0);
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Thanks,
Hyunchul
