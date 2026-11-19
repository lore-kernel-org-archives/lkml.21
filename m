Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073770;
	b=wdIrfFnypsqMT1mMFEIyWVr0tqaOlZH0AbWigExgEa7vCTivPhQ/tKRXRPzKE3j9G738
	 RufICfkmuYIlAao7fp6tuLiGtu1t92ArC4FW3yR+tlryENcpFYQottaKbEhnTyqWOC4qQ
	 mj3yqFNLYjVFTVaqHwii6kKvgtaIn9qdFho6HOHePRm03zjdNl3L0pj6INL+STQReuOhq
	 YdpvmRLlic7lQkRih7b5C2SBUAkDfaOxMupR5Hjr928puLVV9hs8mgwSBxJ7KVIb3L8/u
	 gfNA+sPXCf+S24bNTFSvZelru1PAOwL/DTkVTRuDWMy/Ndx8ntIpp9JKWSKn++RJuwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073770;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TYXQVdddJMJhgchsWgkvy/MvJAjZnwkHSiuLmFLtt2c=;
	b=VT6PgG2J0q4vCV9f8LdnzvUWUPbbfbN/uPizS6EpeCDBv/0uVNQsjJ9V3rKE6oRJt6uS
	 4oyYwxHKTuuY6AqJf3Hzgwguhr9rkJ8cRC6likRyzf93iaLkKsIEWabuevb1+jqrI5D5i
	 vvMfbFfP/4M7yfT/hFDmztk0Apo1nfrcPxWNoxsKXTN1c0kuoDkufCOJogjKB7eksa6c3
	 aAnRs9IO0KyHdU0kV9YAoszWBwxag4mMXsV4AYWWi9fb4Wf4G/EbB4ptN8uwVrnU49N1G
	 p1GThjhUcknA1rP5erlgv446BoYcgJYof+qQGTC+on3ktjrvXpJrHoHKR73jn8vfObw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/hzQNo+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5C606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/hzQNo+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F0C1F000C4;
	Thu, 19 Nov 2026 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795073769;
	bh=TYXQVdddJMJhgchsWgkvy/MvJAjZnwkHSiuLmFLtt2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/hzQNo+xCwvXgKK2H7WPL+/+TuZkNqeVUTjGQ15SgSf9JQR4byzRy+16HIRYORcR
	 1nHKUf0MWnl+LiPIxK286nvsMFhM0O/9HxRrdYhboemO7RrusvmZ8HldFWHfcv4cZ9
	 WMGbTIXTNG76T+MJdlAaudlQ7lD4Xhi5HXV6SahVqmg9s+hom0hYSrgX9PTuqdKIkz
	 Nl7TXTBtVpusPvzDuMLc7J9i5yOFN7f2bYSOPR3REHGVfmm5U5j4aWeN/hkc4KYhl1
	 o9tf/GsebHCqqeZ3wRzUUfs7mI9GU4nJ7VZ3NxXsYbOI3xltdpRsFUUKlYKfomWsrF
	 HqpNyOvDVnq2w==
Date: Thu, 19 Nov 2026 09:36:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Lorenzo Stoakes (Arm)" <ljs@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/secretmem: Keep locked memory accounting until inode
 eviction
Message-ID: <av6m4wU7iDOGviIa@kernel.org>
References: <20261030152407.113568-1-pocj8ur4in@gmail.com>
 <45ce0b42-d45a-44e3-b300-607989e618c5@kernel.org>
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
In-Reply-To: <45ce0b42-d45a-44e3-b300-607989e618c5@kernel.org>

On Wed, Nov 18, 2026 at 11:59:57PM +0100, David Hildenbrand (Arm) wrote:
> On 10/30/26 16:24, Baek Kyu, Kim wrote:
> > A secretmem inode can outlive its original file. An O_PATH descriptor
> > opened through /proc/self/fd keeps the inode and its unevictable folios
> > alive after the mapping and original descriptor are closed. The file
> > release path nevertheless drops the locked-memory charge, allowing the
> > same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.
> > 
> > Move private-state and locked-memory accounting cleanup to inode eviction,
> > after truncating the page cache. Keep secretmem_users active over the same
> > lifetime so that the hibernation guard covers retained secret pages. Let
> > iput() handle file-creation failures and tolerate an inode with no private
> > state.

I don't like the last part, see below.

> > Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
> > Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
> 
> Lorenzo, Mike, this problem seems real to me. Can you take a look?

Yep, it's real and the fix is correct.
 
> > ---
> > On an arm64 QEMU guest with an 8 KiB RLIMIT_MEMLOCK, an O_PATH reference
> > retained two secretmem pages. The baseline dropped the charge to zero and
> > allowed a further one-page fault; the patch kept both pages charged and
> > rejected that fault until the last path reference closed. The Image
> > was built with KASAN and lockdep. Hibernation, other architectures,
> > and long-running concurrency were not tested.
> > 
> >  mm/secretmem.c | 31 ++++++++++++++++++-------------
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/mm/secretmem.c b/mm/secretmem.c
> > index 384f5cfc457f..fa8be360bd2a 100644
> > --- a/mm/secretmem.c
> > +++ b/mm/secretmem.c
> > @@ -185,18 +185,14 @@ static void secretmem_destroy_inode_priv(struct inode *inode)
> >  {
> >  	struct secretmem_inode_state *state = inode->i_private;
> >  
> > +	if (!state)
> > +		return;
> > +

Its really not obvious how we can get here with state == NULL. 

And since it is needed only for error path in secretmem_file_create(), I
suggest rearranging the initialization so that we never get here with NULL
state. 
Allocate the state before creating the inode and adjust error handling in
secretmem_file_create() so that we always get to iput with valid i_private.


> >  	secretmem_unaccount_all_folios(state);
> >  	free_uid(state->user);
> >  	kfree(state);
> >  	inode->i_private = NULL;
> > -}
> > -
> > @@ -296,7 +292,7 @@ static struct file *secretmem_file_create(unsigned long flags)
> >  				 O_RDWR | O_LARGEFILE, &secretmem_fops);
> >  	if (IS_ERR(file)) {
> >  		err = PTR_ERR(file);
> > -		goto err_free_priv;
> > +		goto err_free_inode;
> >  	}
> >  
> >  	mapping_set_gfp_mask(inode->i_mapping, GFP_USER);
> > @@ -309,11 +305,7 @@ static struct file *secretmem_file_create(unsigned long flags)
> >  	inode->i_mode |= S_IFREG;
> >  	inode->i_size = 0;
> >  
> > -	atomic_inc(&secretmem_users);
> > -
> >  	return file;
> > -err_free_priv:
> > -	secretmem_destroy_inode_priv(inode);
> >  err_free_inode:
> >  	iput(inode);
> >  	return ERR_PTR(err);
> > @@ -335,6 +327,18 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
> >  	return FD_ADD(flags & O_CLOEXEC, secretmem_file_create(flags));
> >  }

-- 
Sincerely yours,
Mike.
