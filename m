Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956928;
	b=Xl2/NPuwgNVMm3kFrduR+EeumpIU1RVu6N/X+8dCbjOFH+T0ApgvnH+NYTeY5FCbWYtg
	 dSU+Nje8qGOSFyfIRQ4PJHxyhI8/t1cFQNi6I2L7coZezu0/Z63uxm1N8NcLO2sGAQSj8
	 HOR+HEjvGTeNW1GnlJoraw+vWT0ijLtB9hLA9Z7RJyMGJXdC639KC55pIABhDwPxF72jD
	 vV4omlzZFMuOntDA3Mci2bTaXAo0ydMSOgKNnGBgfIRkUU28+8JdgW59ZYWX7IFYD04sO
	 raYtRaDoekedaM0V+km1pqLdaiLvgirrMJoNYifwa1kli+TbYEBG/n1UPBFhp5wZoYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c5oD0tLMxNN+L1nREdH0vs+Q+g0/BB/zfqPp5PmXkHo=;
	b=d6fR0J2JoZgMIILipJcZa7awOODak2YKIXnMWX0hd3/FQtSotOavFFErCSj3lNwx+MhZ
	 5/ZiO/ZMyZ8iJo2thvgvlsd0S5ivSs2QlKUGJ77ybnUl6lqf4aZoy6yUZXk2A2RaDa07O
	 S08xMj6x3HKyrBKll2oEOcO/JWS+00Fh0bNhGIOouppf5ePZW+RAo0LFt9gQl8/hiBH+q
	 7yLMsrtxcbhyic97KrkCgZz5MIG7B2MopdIJ+bTqrY5z5Cgp92MnTQrnJQ5Ttw9FRUD5/
	 XJiq6S6+4xtxvP+wsjgjxDKQPKnljnL2QAnUdzdAV3ww6ivlDtfRzOkt/TBQXhQ2p7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv5L2OH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4393C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv5L2OH1
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f269e335eso47243585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956927; cv=none;
        d=google.com; s=arc-20260327;
        b=by3eyeCwMnEPoRmCJek78Jz2GjkuBvPXSs+06Ja58n9eBLKwKj0M9Oq5gi7JftB0Nv
         ZniAFJ28LyXF44seykF/5AAKbB2nbUvWHIord6oCu3KE84iMS8VNBHaq0BUo9hgXpDkJ
         Bdv/yLYp5u9WCRIHABPyISk9WcEBev8wSTnMmcytnZjLJfSfP3dgucgv72BHXfiB6GYo
         MclJBUP24vPavjFKl74j6x9UA+Sk/mPqV7IjAWVyfH69wl4ZDz4r+fNyu4nqzGgaVlA6
         YweX5D/yKZd6Qibj2xmBO19HbwfaaTVvafsKuKK9ma5hQkt98UkDvkjXnA27Bl0n+dxt
         ieUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5oD0tLMxNN+L1nREdH0vs+Q+g0/BB/zfqPp5PmXkHo=;
        fh=ScvgSf8pwyI5DO4HK3aja+vsq3E+FcY0f1sKXPyqr9o=;
        b=InJk6+1Zw/xTYKCyJhcCp4N0szs0hX6rKHfeBbuxgUMKchoRa21+B3UfwQaX961PtH
         WHylnrnPkjc3Y2YlKCeI4CLmxsRwEWtZTjwRhLGfA7efh7DhbtownAYOB3YXeHp9ohd9
         ceO+4gzAldUaUaYSb2OApG1xl1bBfIKqiPs56N/EXbieKKbdWfD/9vFb3pHYwxqG3JF9
         bco2DpD+ne1THRF0iipsuYB0gaPqljASJBUwdKJWliD5nj0umpjLkc+5dgg4Rlj+C3Xh
         kuHshKTJRbWAtUAPdpWdQd3r/YKEwsttBM9n9A83ZfKUVFtOj3zJpS1NJ/gBvjzPCt2r
         MoPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794956927; x=1795561727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5oD0tLMxNN+L1nREdH0vs+Q+g0/BB/zfqPp5PmXkHo=;
        b=Tv5L2OH1FQpdOSFR3ZvqD+zPqDpGvd4wbf71Cu/yrag1dW1t0h4FG6jYLxaoyMi72d
         UwvNOB78cpsZPgBd21kka2hA0sSG/6nRwSdZnGPJu7QZoBDat/c1Ve0prfridK6Knyn4
         ckFi9dB5sEtfUGFlv2fOkkkwrUAxGd5WaO7nSfQLS/PuYhK3RWeojpHpS/W4vHq9A+1D
         zj72iiFpbWFlt3MPfrkQvFLnONhyzEwbzKq3zINBl0ZGArn8PdZye51aw3rCON/ObgX2
         +x98YmkqReMGOg2bNRqKPOkKuFUsi3jI2K4M3QnpRK29kcfBr6Rryi6zUUwUsP2BbCFi
         ebZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956927; x=1795561727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5oD0tLMxNN+L1nREdH0vs+Q+g0/BB/zfqPp5PmXkHo=;
        b=fq/QMfPmb3Ozd950tU/1Gpd0MG8jUHsHsvIo1bz9weU/WcLeHDPoGydZJpN0pi0D8E
         A6x+cQirMEjJjGW5fipBnizvYiaOlzEMDx0+lACK7thQdGINL62Ut4FTZDzqgZ5zELnm
         rydIee6ZHv1SvBBv0zm+Jj9E83DWiVAURBzw/MlvwxPL0vZSJmFeNdtFOrOy7xnUPxBZ
         UOPX++RcTiDpTi/Uu7l7r06CstUWZHrGNFXNE3Yw4HaR5c9fKQA6+7Bk8cKhVc3YFj1v
         8YEMFWDhCpOSs13PtxwJAbx8gmx2Nfq70kiwIaa6yYUXLkDTwY6HzfWygWEFbEFnzYUA
         NLEQ==
X-Forwarded-Encrypted: i=1; AL+hErGFcwPI38mzQGToBL0/8rTv+0vRRbaexTqdNWbooMBHJQk7DElU1oMzEQgxwVjA+gXxcZU6/wxQuQZf6Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9bhxa4LVQUzzzCLajGG+bEk6tdiFMWRbkoCRSTtD+sqGZKdQh
	9oXLM+TfociLGgizbMJgq36b9aqwRVRuQPl15sRgTVUKxmXoP3lRtJPrDkSGaD6FTa4lIaxfEhU
	ZC9NxJsLR1D85iI9NsnlNrWe1LB4jAW0=
X-Gm-Gg: AYBFou2wf9B3cu0qlX2zoFKqeIxzLJgtx4vSBO+7zan5R6KDnxOvtzrNXanmyGwdPDi
	mAAAvWVw5BC7cL5JvHDA4LYglYXczZbDbmvEzIaap5YGX8z/H7wvyqNN4EZUhTla6jcJ16Kdn6n
	7uM4UTTCTR7zg0aA6V08K0AhFV4AxJbGtbemmQPY5AxSCrGSb0DgRuZOv/ZHduv3ZWtiGS/PYLb
	Q6VKlLtfCDS31ow0wtIpBgtzcK/UojibjbdCrW9I6kOGmmMUFzZ3melD3e0yLjliK12zNHG4uB1
	P1RRiX75qg2awB7eQ/Up2btMN6SAxaIPlZGnZeeWxfMJRpiLmcTDmADbzf4MHh1Swh3CwJejot0
	x7nfkzNn3MVBCiZXWJis0/pnIOhXlbbKx6xbpEJRE2JBd8PtbdoK6rZVbS8OTwZd6jK673emxTG
	y1KX1cY9/DvaeOl3j4K7t6g0ElQhm01DbnerTmH3Ns/4j//E17ZKjoeHISwIVehMMauMOG3ZWHE
	ucymXPpUbfF1JlV2UDnM6JBX3mCQdwUKYBh2PrV3kBW2ikFY/68CfeBUiLXqA90k2DXKD8a6XyQ
	gRRjwzsqLmEL
X-Received: by 2002:a05:620a:46a6:b0:949:64c2:1630 with SMTP id
 af79cd13be357-949995d909emr225332085a.47.1794956927022; Tue, 17 Nov 2026
 15:08:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117164756.97065-1-jain.sm@gmail.com>
In-Reply-To: <20261117164756.97065-1-jain.sm@gmail.com>
From: shashank Jain <jain.sm@gmail.com>
Date: Wed, 18 Nov 2026 04:38:35 +0530
X-Gm-Features: AclHuK_stX8rGF7FB55S1t8qyAd5lXqjdL2y4CcMcGEKh7vJZTeOKIecSE-swS4
Message-ID: <CA+FWx=nHkuDf_+Wq4Zk6BuxKcC=EwcmZsVVviyQj3WyXF5EbHA@mail.gmail.com>
Subject: Re: [PATCH] iomap: fix offset truncation in iomap_fill_dirty_folios()
 on 32-bit
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@lst.de>, Carlos Maiolino <cem@kernel.org>, 
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One correction to the note under the ---: it was Willy Tarreau on
security@kernel.org who asked me to post this publicly, not Matthew
Wilcox. Sorry for the noise, Matthew.

Shashank

On Tue, Nov 17, 2026 at 10:18=E2=80=AFPM Shashank Mohan Jain <jain.sm@gmail=
.com> wrote:
>
> iomap_fill_dirty_folios() turns the page index at which the dirty
> folio lookup ended into the file offset it returns to the caller:
>
>         *start =3D (pstart << PAGE_SHIFT);
>
> pstart is a pgoff_t. On a 32-bit kernel the shift is done in 32 bits
> and the upper bits are lost for every offset at or above 4 GiB.
>
> XFS uses the returned offset in xfs_buffered_write_iomap_begin() to
> trim an unwritten mapping to the range covered by the lookup. With the
> truncated offset the end of that range is below its start and
> xfs_trim_extent() leaves a mapping of zero length. iomap_iter_done()
> warns about it,
>
>   WARNING: fs/iomap/iter.c:38 at iomap_iter+0x33c/0x36c
>   WARNING: fs/iomap/iter.c:39 at iomap_iter+0x34c/0x36c
>
> and iomap_zero_range() does not terminate: a mapping of zero length is
> what the iterator takes for the start of an iteration, so it asks for
> the next mapping again and again without checking how much of the
> range is left.
>
> On i386 with XFS (4k blocks) this is enough to trigger it:
>
>         fd =3D open("f", O_RDWR | O_CREAT, 0644);
>         fallocate(fd, 0, 5ULL << 30, 1 << 20);
>         ftruncate(fd, (5ULL << 30) + 1000);
>
> ftruncate() never returns. The task spins in iomap_zero_range() with
> the inode locked and does not react to SIGKILL. A write behind an
> unaligned EOF which is in an unwritten block above 4 GiB fails with
> EFSCORRUPTED instead, after "XFS (vda): Access to block zero in inode
> 132 start_block: 0 start_off: 140002 blkcnt: 0 extent-state: 0":
>
>         fallocate(fd, 0, 5ULL << 30, 1000);
>         pwrite(fd, buf, 100, (5ULL << 30) + 8192);
>
> The same calls work below 4 GiB, and v6.19 behaves like v7.3-rc6.
>
> Cast the page index to loff_t before the shift.
>
> Tested with an i386 kernel in qemu and XFS on a virtio disk: the two
> sequences above hang and fail without this change and succeed with
> it.
>
> Fixes: 395ed1ef0012 ("iomap: optional zero range dirty folio processing")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
>
> First sent privately to security@kernel.org on 11 October; Matthew
> Wilcox asked for it to be posted as a normal patch. Sorry for the delay.
> The code is unchanged in mainline, so this is the same fix, rebased on
> 666539eecdf4.
>
>  fs/iomap/buffered-io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 6d843b1..846f87a 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1735,7 +1735,7 @@ iomap_fill_dirty_folios(
>         }
>
>         count =3D filemap_get_folios_dirty(mapping, &pstart, pend, iter->=
fbatch);
> -       *start =3D (pstart << PAGE_SHIFT);
> +       *start =3D (loff_t)pstart << PAGE_SHIFT;
>         *iomap_flags |=3D IOMAP_F_FOLIO_BATCH;
>         return count;
>  }
>
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> --
> 2.43.0
>
