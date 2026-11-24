Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516085;
	b=zpqb7ctZUGFSa0y1C926UdMUXcJglrPLxnsP396bwJckthVvTIE1G1iUTWA1WcjVp403
	 QE8YgX0Aje6ptNp8ik8WNDRLcR16pczMexPOe7YVmifcqud0EzSKQtAaKM6HncmUtfbl3
	 NgbgqOFIPEbx8rTpxvuKkm3X+ad1q1v6Sxa2UHGz8JBugWgQCrrZnI0DnTUtYNWTU/tKq
	 NbsIyBLllQCtI4b4UJWtDQqfXmmF4asbLLwq6C4f4FRAwPv/Yrc/2wu9v3sWZOlArWCW+
	 zX9JqKdcBBq/YO0ir/ySYim8eYOPXfR5zZ/5BmjY9q4tgVzvAdtVs+jeZhGnCYcRG+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
	b=XUPk+V1bdVxWoVkRN6viAP6RR+Ltjbm4ZhlP6nSlyb9wh+h9hConMmYwD/AZuiZkIdfL
	 9I+EshPWo5QZ2JWCt9bUe9AW1Jm02WRg8/kyS49yVUzM2iTsl7q3Q7kz/W7xVxdCsNm7c
	 iSegJwZ1QiZsws5m1VsuK1tpL5XEuYtoZgGbzoLM9MAT9MRjYnzLKT9ZaHw0FIlhTRvxv
	 VOgLrIRpgvnAPkx6I4Pt962rk0VEqhxnHV5sOMZu8uFwO8vlZNJXthahW9ToSg1e8tdLm
	 l+n/sSCQg0axYQ/96JE/blsE15lW8ZISIsGWXOQFgG5tcxLNQWSYc62pc+j8teTm2vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S1hVEpmR;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2C606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED2C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S1hVEpmR
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3785455f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516083; x=1796120883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
        b=S1hVEpmRsbbmzBrB9VjESDpXpOxioK8WkMs7ZAAZrbFF8ZJerfE7VM51CPf4BIOj4u
         HQXzNOVGeYyvf+axUJ3+fePPXQeg4EhaFMnqcRqdbh9KhbvyyYDOpq1VuIidrTppRO/v
         dIZ9HmFn5D3R6iSJ+QkipjMJdOcwiuPzEToDOn1Gzvn/Fcd4SYxqgfgQXP8rXM8RM2/t
         Cx6JZ7o0fNNI9/gtrgElxsvFtOHAfsnfbb9eKX+DNAGzXDTFTMrQpyrlPqRLrZLebFEq
         0t7f7+npFPYY/WNFjq/w5jGWYFfUasaJNeZcwGNF3i6C8FsUJuw94xjlCQ/+OZ6r0SbG
         9GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516083; x=1796120883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
        b=BG+mFr24RIXzxuowMPOfr5oK9euXfyrV2JSfKWl9U1GS3EBlbMVYbjQXv8q6JfzbUj
         wHl4nx8PynnO3EMl+AXTYlAz/OT6OGZiMYxAPEedOfc68I+zoJHngwvtD8wuFXotYDaN
         /fn39jA3ed4zJV5woXtCFML5XkRJb5hgA+0w5mkEnaXfBsSlXb+h8mJ9iSEmqtSMCMYg
         I3ipp9LbRD0ECWT9kRqaxLTHOppO7ywAH7bYxf9XTL8jgc3GVg65aosPX79Nj6fEB5An
         ZlHeUN5+QWmhritXegb1UYbKS3JRigf3sdqbqKK2V86Q/aBov7EI1eaeSlIiGVVsLetR
         rjkA==
X-Forwarded-Encrypted: i=1; AL+hErEiuE6X8ErLsMEvEqrZWPxuu3K7/6GyM7WWHj5YVHV7VwDBoXTEC81gOpMkhaBvqB3nTeJAzSQq54eifSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cu++krpc9GtI1b4tyyF0C8yCFvGOR40swxn5anuioVV2m/H82
	MBCJRjBpgiDSSFAo62T2yk8i4KHUYb+m2K2hsOK6p0vBMG4N6C8Rrh5XcQNs6QnFwKY+RcnL112
	GBpPfLkc=
X-Gm-Gg: AZFdTZfo2K8w21JslLeXj1MRQXWmpPtR68FQSme5mS1mNQRc2bznGw6RiXW+rwH0KVU
	S36RcFyRzwWWMXH5apcrdUiflJlyN5miU9nLAAKQVEDkuDuN8kPC2F72j/OcSbzQFdF/kAFbHwY
	KSVW7oGbFAzYeo3OSzwFZuxeHxPdbMig0f50nqIYbu/kS4GxTGck0jhjFpB8SPGB6ETqahlVBA1
	ojTzXKqLKO3GR7N8u5TRH6K4CN6O9aILVU1fp1VsydDEOHxwSHSuSWMsnOoxK7vmE+tWDTgyc7f
	TUc1HzP6P1DMyno+1AAmKAclsGeLLWe0y16uI5AX/8Q1dZDbrax1fSRy+iXGvzh9yZ7JPQSH4k0
	xd9fa+k7bybkXHYyPU6RMyBn2XfbqZPVb2bNPVlFi4GaZHTJWNiranMyC2WXbBhGpEDJHmwfmvo
	5z0/UWJinDWzPAhDOeidq2qbow/DOGrUACXLYqbGWXexEvf7Vj6alDuKsngauopOGKObvNEjnbY
	Fd+emMZ6cZ3PQeXAWlET6172Eu3Is5CObfw5huPmNMl/TqrLH0vapfRCzXmkxXQONbGCxbvOS9W
	qfXgUDZRV1OzCRGtif+X597oe/3z16s=
X-Received: by 2002:a05:6000:29d5:b0:4aa:5833:c0fd with SMTP id ffacd0b85a97d-4abb58ec23cmr15948598f8f.52.1795516083446;
        Tue, 24 Nov 2026 02:28:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm26231621f8f.56.2026.11.24.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:28:03 -0800 (PST)
Date: Tue, 24 Nov 2026 11:28:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>, Chris Down <chris@chrisdown.name>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <awVmsdsIa9niLarO@pathway.suse.cz>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
 <avrJl4lYirh_7oQ-@ashevche-desk.local>
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
In-Reply-To: <avrJl4lYirh_7oQ-@ashevche-desk.local>

On Mon 2026-11-16 11:15:03, Andy Shevchenko wrote:
> On Mon, Nov 16, 2026 at 10:56:10AM +0200, Avi Weiss wrote:
> > seq_read_iter() can advance the iterator before the next record
> > fits in the read buffer. When iteration resumes, pi_start() calls
> > pi_next() at the saved position and advances past the pending printk
> > index entry. As a result, index reads can silently omit formats.
> > 
> > Return the entry corresponding to the saved position without
> > advancing the iterator.
> 
> ...
> 
> > -	return pi_next(s, NULL, pos);
> > +	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);
> 
> Side note (because it seems used more in the same form), we have file_inode()
> helper and this should idiomatically look as
> 
> 	return pi_get_entry(file_inode(s->file)->i_private, *pos - 1);
>
> But I haven't checked if the file_inode() is recommended or deprecated API.

Good to know. But honestly, the variant with file_inode(s->file) looks
less readable to me. IMHO, it is not worth it.

Best Regards,
Petr
