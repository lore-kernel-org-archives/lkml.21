Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592363;
	b=h18vQ6w/dLl0am7jZ9p8HaniYQBz3liVsXq2lAWSTonvU0oIyGsZUzzNz10Hd556SzQ4
	 vNu6Y/TPSxnrNd6Sk7CJ/zVF4G6UsX6HJuwJ3hiydFKKUkzGHVzgwKWm6kPQ8hJ8W/0M8
	 gEMPtfNGuaxx9vvgALCZn91TdjMM8FVC0iJ/s5EC95l9BIpy6iVgJQNv4mUgcPlXtjX5G
	 QJ8JBVwv84C/lwW4ygrcB9cwp+LUMd8glboi9vyTDufDxhocaXnuIx5GBYiTUgwfeHWpF
	 Qd1eihkLbTtRc+LWSAbZRguWtMDiP+fawE285JR1VTqz+SYpeDuqHRgiZ+F8Uq5TcpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
	b=fUNPsyf3mpEZ4dehU8xWaVojP2l3RbpQWsM/vAsLiVkWVno82ZCCiuNlq0KhcWtuXcPl
	 TMpoTHoJrB3+Np/n47q+EByXrc2UsdtIR1GjS+3Z3a0pWaL7uPYswK2xfAejnUkP4kHjB
	 R7X53CmRYWKWXD06q0p7LDA4lrQjW2pD9K+b+tZck7RhJUoA1kmiZISPtoEvziSS3iM32
	 9MvE5Mn2Rit1e15tXovQyafO25cv1V73XjpKlIEQs9C1MgFZngaVX/Sg+yHk93A6j93Ga
	 6/GkBwoKb17AIIsZfhpGDHMpfNJl9YT9+MHjv/f4JV75uTRuBIYlxxZmkSIufMiZh2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZXaLp3K;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A225606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A225606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZXaLp3K
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so2341965a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592361; x=1796197161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
        b=EZXaLp3K3PqUTbz+SRwAaoremi3tp1/FVit1v0BXVVtqqRZa/pCrvGM/m+cMTygeTI
         TUtz1pQek6MevA5NgWVevpQunkUI4zyu99mx1lptMvqlFsgd8WpIWUY1fz73PN9DVwN2
         0s64jG0hsxWEkzvE511tuzg3TAHo9m+UlUjxMo34+6Auv+6tJfdK9Rcm5PvbrWkeut7M
         MVbmGxzsRgRJfX/NYDWGg5wnUmHqutSGPCJsH8TAx2fHMNzoVEja7TH0xrN5cRJO+/XG
         SuooM8hwfM0z7J14m9C8oNaJ0R0w/PNg09StnjNumRrkFTsIWQMkqODACrj7rxatjteD
         xMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592361; x=1796197161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
        b=eSpN9pv39KEXZ4ViiNKa6Z4nz3cxkcXIX1oGQO32JYOBfh+sVKUgg+Ejt0qpUzIQum
         j09h32KWe/fLwmlPnIvrURj2rgmf8UBaG2ZVcq9PRr2wnv/d/5s65OsMEyjEwrIFCWav
         OQJBQkquoJT7qtGd+j1jJGXaGaZt/2tYubxutZ4f1J7oyUs9Hh+PKf4c3hs2cfcoBAry
         0QT4nS4llwncygShh05MXDMZviULm5qij1JWmwL5wItoCa6EIj/FggOS3jnr+Kpgvd0b
         rVVnSmZYwQ5oxM1uPAdufHmtGIF6AvKaVmsfI56Deg3cehom16iHL821YgKDTT1SA+ZT
         4KsQ==
X-Forwarded-Encrypted: i=1; AL+hErH+wFIXKSORGRVpdFA1yM3kMQ8ukbw83Bi2gnn0DBwf0QLzTkfQjdQU9LysYGl4Hi5ntFSEpwVgV8L8zMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j3sQ34BPnxL0462DlIG9QLK9htomBZBDwWJuTy8TurISsMwiK
	YYGObyBmOai1LG4qYQ+vBIyB7jcZnv3jGGC1yFPm3TcqURK7qtiLIUo4aI5PN/Gw
X-Gm-Gg: AZFdTZeo54B89Q4+FlBDE2qvrV0jMwtiOwc92ThdpgP/FO1ZvookH+zDgJZD96pNGNg
	uRCCySD3FTld7uyLLS/y/6Hd2xnfdFtvwI6DiKtDl+20Kh1aLtmNebZCr/ntpOgYl9u69pX5OLn
	3wrp6wAYiu9Q/g91hNMlkOtWThifpSE8u2u9abrGp7aJOQIAZlgUDR5LyE6D4cbYHYp0vMm9D1W
	0GNgFTzCG5caBNAkDTSXRnWwYQTf23KdguLkX2MHStlLy3iBi/CShbZuKAnIwV9i1jrNLpok8X+
	f5jEQuWhMDqX+OWYhujfuKMYfDeIKh77WMHoOQngdknHh8mn7EeTQg932HFZhgZeNTr7UDZJqQt
	iJcNABpe6JpFGDt3qhaDJohxTibDPW0DvDS673l8TwWSbNu8IijPVKFcjm1mpHCrufZc0Lm0YNi
	0dQKCWYaiY+3HQjHnynk5TK/fwJe/iHIVG+kFBXRAuF96DIpAInY0kI6RkVEmu0KBkQ2t3HQKDw
	IB484NLbiJmdR3w1a3huW187xNcBkm/teZIANB6qa6p1Q9PI4CaPTNY7YOUR3fmpkI4/5tBTQVE
	7MmLMPnnMdIpUJz1jCWiAKh5st7G+ceZdr+Db1h5
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id 98e67ed59e1d1-3b4d00bd2cemr5306069a91.51.1795592361362;
        Tue, 24 Nov 2026 23:39:21 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25401175a91.7.2026.11.24.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:39:20 -0800 (PST)
Date: Wed, 25 Nov 2026 16:39:18 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: shaos <shawnq1@163.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: guard the final LZNT1 sub-block header read
Message-ID: <awaQpiz7OUqAOogd@hyunchul-PC02>
References: <179558384099.146091.12975349907127521352@163.com>
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
In-Reply-To: <179558384099.146091.12975349907127521352@163.com>

On Wed, Nov 25, 2026 at 05:17:20AM +0000, shaos wrote:
> Hello,
> 
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that two bytes remain in the compressed buffer.  If
> one byte remains, the read crosses the end of the 64 KiB
> compression buffer.  A crafted compressed file on an NTFS volume can
> reproduce this as a kernel page fault while the file is read.
> 
> Check the remaining input length before dereferencing the header.  This
> preserves the existing end-of-buffer handling while avoiding the read
> when fewer than two bytes remain.
> 
> HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
> source version: Linux 7.4.0-rc4
> compiler:       gcc 11.4.0, GNU ld 2.38
> 
> Related work: ntfs-3g has a separate userspace LZNT1 bounds fix that
> checks for two remaining input bytes before reading a sub-block header:
> https://github.com/tuxera/ntfs-3g/commit/6aa66d98980ac1d966d7977c7b079f4fe380eb42
> This report concerns the in-kernel fs/ntfs implementation and is backed
> by a kernel reproducer against the revision above.
> 
> Console output:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/console-output.txt
> Kernel config:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/kernel-config.txt
> PoC:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/poc.c
> One-byte image control:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/one-byte-control-console-output.txt
> Fixed-kernel control:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/fixed-kernel-console-output.txt
> Image builder:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_image.py
> Initramfs builder:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_initramfs.sh
> QEMU runner:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/run_qemu.sh
> 
> Build the test kernel from the specified commit and config.  Required
> tools are gcc, make, cpio, gzip, QEMU, and the ntfs-3g tools mkntfs and
> ntfscp.  Run these commands to download the Gist files and build the
> kernel, create the images, and run the positive and control cases:
> 
>     work=$(mktemp -d /tmp/ntfs-lznt.XXXXXX)
>     cd "$work"
>     gist_id=acbe634bf90826a626ed95d0f32b5ab4
>     gist_revision=ada97c11fe984e4bf47b9c93a0d90d30766ca3c4
>     gist_base=https://gist.githubusercontent.com/shaos26
>     gist=$gist_base/$gist_id/raw/$gist_revision
>     for file in poc.c build_image.py build_initramfs.sh run_qemu.sh; do
>         curl -fL "$gist/$file" -o "$file"
>     done
>     git clone \
>         https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>     cd linux
>     git checkout 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
>     mkdir build
>     curl -fL "$gist/kernel-config.txt" -o build/.config
>     make O=build olddefconfig
>     make O=build -j"$(nproc)" bzImage
>     cd ..
>     python3 build_image.py images
>     ./build_initramfs.sh poc-init initramfs.cpio.gz
>     ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
>         initramfs.cpio.gz images/positive.img positive.log
>     ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
>         initramfs.cpio.gz images/control.img control.log
> 
> The image builder creates a positive image and a one-byte control.  The
> initramfs builder compiles poc.c statically.  The PoC mounts
> the positive read-only NTFS image as /dev/vda and seeds the shared
> buffer by reading offset 0, then reads offset 65536 to trigger the
> fault.
> 
> The positive image faults in ntfs_decompress() at the end of the 64 KiB
> vmalloc buffer.  In the preserved run, CR2 is the first byte after the
> allocation and RDX is CR2 - 1; the faulting instruction loads a 16-bit
> value from RDX.  The one-byte image control completes without a fault.
> The proposed patch was built and tested against the same positive image;
> the fixed kernel completes and returns byte 'A'.
> 
> The trigger requires mounting a crafted legacy NTFS volume and reading a
> compressed file.  It can crash the kernel on the tested x86-64 layout.
> This is a local denial of service; no information disclosure or code
> execution is demonstrated.
> 
> The range check uses the remaining length rather than forming a pointer
> beyond cb_end.  The Gist includes the positive, one-byte control, and
> fixed-kernel console logs.
> 
> Fixes: 1e9ea7e04472 ("Revert \"fs: Remove NTFS classic\"")
> Signed-off-by: shaos <shawnq1@163.com>
> ---
>  fs/ntfs/compress.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -201,10 +201,11 @@ do_next_sb:
>  	/*
>  	 * Have we reached the end of the compression block or the end of the
>  	 * decompressed data?  The latter can happen for example if the current
> -	 * position in the compression block is one byte before its end so the
> -	 * first two checks do not detect it.
> +	 * position in the compression block is fewer than two bytes before its
> +	 * end, so a complete sub-block header is no longer available.
>  	 */
> -	if (cb == cb_end || !le16_to_cpup((__le16 *)cb) ||
> +	if (cb_end - cb < sizeof(__le16) ||

Could we go to return_overflow if only one byte remains for the next
header? And the existing phrase-token path seems to need a simillar check.

Could you also format the commit messages with the Linux kernel patch
submission guidelines, and address the warnings reported by
scripts/checkpatch.pl?


> +	    !le16_to_cpup((__le16 *)cb) ||
>  			(*dest_index == dest_max_index &&
>  			*dest_ofs == dest_max_ofs)) {
>  		int i;
> -- 
> 2.43.0
> 
> 

-- 
Thanks,
Hyunchul
