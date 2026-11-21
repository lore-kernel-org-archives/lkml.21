Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270120;
	b=TqO10V/4FcNlTlidWWsTewEr+n7TH6EzKZJXmWzsIdq2ZPBypFt540Qf1p1RRBOLl2yT
	 munixw5PgACWAducnUF18TGfAJ3bm7thPZ/nj4fGOgYZJKaA4CR97Kitc8HVVXg/5Y5VU
	 CLHsNqNLlwkExHd214a+EBHQ0UCpLesze6ky+/BdIf9BKiF2PLAHiIbwlTkpaDLyIX5T8
	 h1xGcicHY3eDFTKJUN/uAiu1Th0Vqwjms/d0A637dAQ0bJaZ6+MYTJZYEAQAagj/IGvH0
	 HJ8UlSS6+L5XCr1jvAY3YwNeaQzyWylLX4/2wooaFezS6fCodDTNETHVFAxM+Y/tpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270120;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lnGVixuqfweqtI7qRoDDqh4cI7BpQx9TnUNrQEVGbGQ=;
	b=FOlKcuCrNuG4I3KbF1QYmN0hBgFIjDJW4ankTjsm07FuMwMPZ2AaFbPc9nzGoN9GoY8M
	 UU1uhWoIoC0tou0oodbJVRZ6toUsWzeHJtWKcGXizhFDPwIXXGULM0ZkNkcS2m0U7RTnC
	 j7Wq943SiGoHNPA3o4MRm2Xx8A3ke2UuPEr27rPzGU4eHrtCFAzieObU9WaMo6JuDM6H1
	 8XOyqOtbKLN3OaNEHPhL/SwOyRNrWrz1lCHFmoUBYeMNxIqzu89euPqYp9ErILgIb2mOv
	 RUArUDIYHk8BV4our0g2S7ywaPvlKHzwNn5+JiaEbhi69zo5lKB1Q3lKFb1G4TXmPvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYC6W9OL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC8F606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYC6W9OL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A41F000C6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270120;
	bh=lnGVixuqfweqtI7qRoDDqh4cI7BpQx9TnUNrQEVGbGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gYC6W9OLxGt1XT5SdWLeU+nCBg7zorh8Q6gJSM1yh8p91NjEFQxcwD0sfeyX+KKkC
	 PdyhV4hpIAh/a3OTkmLxiudZCMBtlI1+BSkZsyYuk6fBmpJBvHuElSj9TtlWe1XPCj
	 alt8ge+tS5EBgP5pkqTZgWLN4Bdsa8pUS145Cu4uq+x/yvMeO6807fh+fUFuWpvd3y
	 LKQAJ7iCvh/5n2SeQc+tSAhLWZgLbxFm56ve2I65uSNcOhjfBbY7lDetgiEf10igKq
	 Zq5kVlBv7kd34lBVWbG2dTr8pYoQCbzw4ET6wB9UNCzbmGDxkvsGoc47phP1uuCvax
	 Ia+cJJd+7QP1Q==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cdc606b47so327753466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/RKNStD1NxZjgVXomUlkxYCf4hR8BY7YJ98Glhvqluwoe5aXNCJ3w9No/XsMgJVovKHKicQ9pAzSjaG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D6mkG7FPf5rIIiCzeGAFsn+seFf54Ov3xZN7dV2gTAXtHAPCR
	5cekzALPGITqdUBbfPbHID9QC5owagYmLbWsfjvmFBN+auqL1QNK5LO8+zMyy5WwOuw7LZoTf5h
	Evj1p1Y074DhULJXl42UurQlAgKINzqs=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id
 a640c23a62f3a-c513aabb216mr429989766b.40.1795270119029; Sat, 21 Nov 2026
 06:08:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-2-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-2-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:08:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9LELh8vZnEEAH13UekhS0tSrXu7rQx-X69fNuK30xjgw@mail.gmail.com>
X-Gm-Features: Aa3M54pWdiCG2Z8XXtJp-AtzH0mAkYUqioKQikR3KMOpN2YjwqtgKK5EYX24HFg
Message-ID: <CAKYAXd9LELh8vZnEEAH13UekhS0tSrXu7rQx-X69fNuK30xjgw@mail.gmail.com>
Subject: Re: [PATCH v6 01/37] ntfs: propagate mapping-pairs update errors from
 inode writeback
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> __ntfs_write_inode() overwrites a failed mapping-pairs update with the
> result of syncing standard information. fsync() can then report success
> while the mapping pairs remain dirty.
>
> Check the update result after releasing the runlist lock and take the
> existing error path. Preserve the errno and retry handling for ENOMEM.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
