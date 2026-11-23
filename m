Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434097;
	b=oum24KAid7r4Y2cSKPk1vEJs26qSULGWvJOc+2rSUYkotGUPqGtyzRkMTXO9rwf69jJ8
	 7qgmkLumtBAa3YH2SY7munDU1In/ZkfCiw8rGuzwFJ1dDGnwi994xfkz941n5sKpQjGga
	 a8y2+Z4FlftVLBBIYXwXVLGjsUPin0HBySP87bZQZ665GNKISi24771+Gy4S/qR9yF/Fj
	 Pk8lLryhvqS/Dw+9+1Bvkvm/y544EyaVGn28tH6fDxTEDCJUn+4b+nNdPeuys5HvP303q
	 qPRR9FJ5B6EGMDZ/5Hz+e20LoioxhSJLK1H8F0VzTD7l/K0NmZLREyuM6P73C581Hug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434097;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=9oFz6UDT8gjmviaKWCp1t0akVQqvfGRhOXiu+f5jWeo=;
	b=UhEW1dIF7Py0JuvvDmM5eatdxJAAeMHQMXCKAmrS63FuHTUfsVMU11dibqUn8LMMoBNp
	 wfh6MEc+yfluRPnlV/XXBk3Fanu8eLd22Iy7bk4Z/05nrxvLWl+CwbV4UwUWYHOzWSaae
	 RSw978EOu1xtiWIKejQxgr1VIrqh/KO3DymEYpQW2qP2pZyAQDOkKvAM0x/Asj2luqw4y
	 WwnMyW4owFPDZ8MC67Ao8tKcbLGuh8RSbqIRmzB+3eDjFtIkA7pcbGq89spxCyRZzuqdP
	 4tr7BmnIqJiP6v4OxWmu+lIh42YS2E7fvf8FcyrUcBC8pZ9ipqm1kqjntgK3z6pnjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=VZA9A8z+;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=VZA9A8z+
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8CFFD1D4D;
	Mon, 23 Nov 2026 11:42:11 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=VZA9A8z+;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 169C8F7;
	Mon, 23 Nov 2026 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795434089;
	bh=9oFz6UDT8gjmviaKWCp1t0akVQqvfGRhOXiu+f5jWeo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VZA9A8z+wHineDXqarlsc1pc2fix7YhKwUB1ZRkQsMhmEpw1LSLuKb24HjGs2EREp
	 ZOnJPo384wF+KIFvGVvgpJ1qMt3/GJwmCHBdsxdbCdt8Bf0l45ThhsDTN/bzvTnknY
	 nSJmEhQFshyJDYHYNmXeGKKoTKD7U87T3JXkmjZU=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 23 Nov 2026 14:41:28 +0300
Message-ID: <e010d85b-62aa-47db-af91-fb43026c8b65@paragon-software.com>
Date: Mon, 23 Nov 2026 12:41:26 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fs/ntfs3: validate target index entry in
 check_if_alloc_index/check_if_root_index
To: Tabriz Hasanli <cybersec467@gmail.com>, <linux-kernel@vger.kernel.org>,
	<ntfs3@lists.linux.dev>
CC: <w@1wt.eu>
References: <20260831142344.472594-1-cybersec467@gmail.com>
 <20260831142344.472594-2-cybersec467@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260831142344.472594-2-cybersec467@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/31/26 16:23, Tabriz Hasanli wrote:

> check_if_alloc_index() and check_if_root_index() walk the index entry
> chain to verify that lrh->attr_off lands on a valid entry boundary.
> However they have two gaps:
>
> (a) They do not stop at de_is_last() — they walk past the last real
>      entry into the trailing gap between the last entry's end and
>      hdr->used, which check_index_header() leaves unvalidated.
>
> (b) They do not validate the TARGET entry at attr_off — the walk exits
>      as soon as o == attr_off without checking the entry's size, flags,
>      or bounds.
>
> This allows attr_off to point to an attacker-controlled "fake entry"
> in the trailing gap of a crafted NTFS image's $LogFile.  Four do_action()
> cases then use the unvalidated entry:
>
>    SetIndexEntryVcnAllocation / SetIndexEntryVcnRoot:
>      de_set_vbn_le() writes 8 bytes at e + e->size - 8.
>      Crafted e->size yields an 8-byte OOB write up to ~64KB past the
>      buffer.
>
>    UpdateFileNameAllocation / UpdateFileNameRoot:
>      memmove() writes 56 bytes at a fixed offset from e.  If e is near
>      the buffer end, this overflows by up to 0x50 bytes.
>
> The sibling DeleteIndexEntryAllocation case (commit fc4626bb3656) and
> UpdateRecordData cases (commit 3e127829e57f) already carry per-site
> guards for the same class of attack; this patch closes the gap at the
> validator level so all current and future callers are protected.
>
> Fix both functions to:
>    - stop walking at de_is_last()
>    - validate the target entry: size is 8-byte aligned, >= minimum
>      entry size, and does not extend past hdr->used
>
> Found by static source analysis and confirmed with userspace ASan
> harnesses transcribing the kernel's exact validation logic on a
> 512-byte INDEX_BUFFER with faithful check_index_buffer() geometry.
>
> Signed-off-by: Tabriz Hasanli <cybersec467@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 42 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index ed50c1d0c..d73e3ff1e 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2953,10 +2953,13 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
>          u32 o = PtrOffset(attr, hdr) + de_off;
>          const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
>          u32 asize = le32_to_cpu(attr->size);
> +       u32 used = le32_to_cpu(hdr->used);
> +       bool has_subnode = hdr_has_subnode(hdr);
> +       u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
> +                               : sizeof(struct NTFS_DE);
> +       u16 esize;
>
>          while (o < ao) {
> -               u16 esize;
> -
>                  if (o >= asize)
>                          break;
>
> @@ -2964,11 +2967,24 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
>                  if (!esize)
>                          break;
>
> +               if (de_is_last(e))
> +                       break;
> +
>                  o += esize;
> +               de_off += esize;
>                  e = Add2Ptr(e, esize);
>          }
>
> -       return o == ao;
> +       if (o != ao)
> +               return false;
> +
> +       /* Validate the target entry itself. */
> +       esize = le16_to_cpu(e->size);
> +       if (!IS_ALIGNED(esize, 8) || esize < min_de ||
> +           size_add(de_off, esize) > used)
> +               return false;
> +
> +       return true;
>   }
>
>   static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
> @@ -2978,10 +2994,12 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
>          u32 o = offsetof(struct INDEX_BUFFER, ihdr) + de_off;
>          const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
>          u32 used = le32_to_cpu(hdr->used);
> +       bool has_subnode = hdr_has_subnode(hdr);
> +       u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
> +                               : sizeof(struct NTFS_DE);
> +       u16 esize;
>
>          while (o < attr_off) {
> -               u16 esize;
> -
>                  if (de_off >= used)
>                          break;
>
> @@ -2989,12 +3007,24 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
>                  if (!esize)
>                          break;
>
> +               if (de_is_last(e))
> +                       break;
> +
>                  o += esize;
>                  de_off += esize;
>                  e = Add2Ptr(e, esize);
>          }
>
> -       return o == attr_off;
> +       if (o != attr_off)
> +               return false;
> +
> +       /* Validate the target entry itself. */
> +       esize = le16_to_cpu(e->size);
> +       if (!IS_ALIGNED(esize, 8) || esize < min_de ||
> +           size_add(de_off, esize) > used)
> +               return false;
> +
> +       return true;
>   }
>
>   static inline void change_attr_size(struct MFT_REC *rec, struct ATTRIB *attr,
> --
> 2.53.0

Hello,

The patch was applied, thank you.

Regards,
Konstantin

