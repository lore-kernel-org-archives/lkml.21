Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083549;
	b=tVY0pg/bf6NGEoZyBid3ovw1/+JJdSaPoPUKhHObm6mtW6yaVGpEbnJJzSosKsTPEwZp
	 JE9aC8eLRyhFaqjY+7GTHyyx8AVxF9Zh5DFLR7wR9YAnL1N45flhdeDd+wtM66UplGWS4
	 faQ0haBM5D9P4Q0HhNSWOCgnWoXX7hQDU6cimFsC4PHoZKHO4PtGX+K800zYFEB4ePlqS
	 x2ld5Su/4Dag4HyhFupZynX1ncuIYNDbMmdQfnHJXLe/XZcMIJuoS25vEkE9Z6ApHYWvC
	 +plzQbJwgRvFNVwVLsn/EqWxTTWZ9MWZVLqy3en+Lc5DZQA9wbGCArufyQBp/e4i7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=L4vvVy0/9SO0hFsfF6FkcqG3rn9hxfjX2RZ8hR2NbUc=;
	b=rBRIEcc3u2qCWlHGMYk45+4fJtzNd+Qy6IujchefT9G6snF40YJV70dHVaD0kRXhx3rC
	 IIKUP+qPDASP1zxOul+oNBVyDBJuUi7eK/qFwwZ7/IRGIZw6rTQIF21/+B/fXu3YC8Ucg
	 NTmXDppnHb7Gx+0VGOhwN2JGyo33qKTTX9KxI5RSZiBdbj4zwINrkFwT4txytqGwC5q6S
	 NP9Bs0aWYDhmH7rGJwYx6+S29KXk3pRjhgtJ5yu7lm9+nldwfLyoAHbmb1Aqj6G/9M3bL
	 wLf5vtNvmcYcqfD1ZuYhJUaLMG7dbhWrXuq9bobmNjAUy+go0Mh47uh7LnFbtglEndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Itl4LpDS;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4365606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4365606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Itl4LpDS
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so425493f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795083547; x=1795688347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4vvVy0/9SO0hFsfF6FkcqG3rn9hxfjX2RZ8hR2NbUc=;
        b=Itl4LpDSFpBhbPWJ1KvZJKnsuDQEn4yGwCgFxlyldiZ2icsEaze5dZmnbsZJLdwtdh
         J2yXVz91hLiJcw/AK6hTnYXvmo68japk+Fi7l6ROI0djidirvo+7Aic+OOCOSDUACyhg
         LsSA4Lo+PpSq6r2lNLLViWKCA1OmKmKA6lKHRajhCqdZuWbmF6yM0g9G+Jpo00vgw86j
         yMtfIuP0jinWDuevKTxowRuvI8XtuJMwvUIe7VN24N51oPsFW4da2/eodp7GG4MbD/OA
         oHAfbz+PJmWKipFgX8nxaNUvfurUmspg2XeFTuALCayGUYz/aKMqJ4BkrmCyoltmnHwf
         +svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083547; x=1795688347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4vvVy0/9SO0hFsfF6FkcqG3rn9hxfjX2RZ8hR2NbUc=;
        b=2ulKhAs0cRaSSPrlAmPjGnZq+Fa0GxLBWncaTD1Bk7+yuI6U+8Sz30fYd0pdxqgFRy
         r+DfINPejOijswlqKqNXwqn02aYGxTADGzx5vCfDPxFVU8gR2p5ePResrm8KdBdxcoBA
         6pU6i+azLnczKPhTarfP5Ax041gJbA4kd+HRXJie3a0ZNea6cJqlqoMmMViz8KLzD4x0
         0LOndyRKRt/spKfp0v85fcrG+T0qG/wBsmTRp633yYDUOMqMHbnkSTXtG0CspujqJjvA
         wrFwZXyxv5q2+tzOCHauSeDFN6ZAOXA/6KQbdpHh9PDMPawCY/RcyBuu+2CwLPfkEA4H
         hzkw==
X-Gm-Message-State: APuU4Z/ofjUFI4SNtnCbUEO9XFtYJq+/yXniOst6Lvahq486TUkTL5lt
	BSXv0c3zt2DNQmZmWOJnWxX/x4KdifYlQf8wNMBSF0AVGflR0NjCNp4/P/um7ScZ
X-Gm-Gg: AYBFou3J3ipG0PzrZxGgOAIkjTreWa4WPTthp/TXPwVmy9BQhpblvpCqGZqEBY2/UyK
	TkUreVueyH56ddFrQfXH0jk5UPYrMG+1J0dsn5psrZAJt5br5reBWQdDUzT55XOPFb5mfbOlmDU
	8MjWA4oV/HinW4pw21v/7UPWlvvRkOzPBovqLaA75Sl8mFp70udVUg7/i7wxEe5/HPSRBu49SjH
	mpwVMKiDPgIt5qQkentv6EAyW2qEUQDP7CoRkc1gj2bm/IUt7KnEE2H1pAtwS7MobVuymhQwR05
	Z0exKj/CDHcdg7uom0qPIkPKOqcpmDX1n3UlrJILUVgHTTVDCLITG0Y+Hd+KeBgue6iuCRq45wj
	G1BnE/rgEe83MHo+6/S8RX8xVjRO0A6rxoMDJu5IyLuHWERyEGhoQh8iIaADuVky4ghxmE4Gaox
	rWq5mZ9kzhWqFdk0d4k1wYNJOiGGaSPC90yQI/iyuDmg3cpWY6ua+DlD75Fj6vmRn3BRtZCRM1A
	BFMB8OqTvtQWkg6DIFkLWn1yJmMwkR20gFm5lBhYbldh0ZfrohrQNOcCokTl8w6J9Z1lZJaaHup
	k4P7ZdN2rOvIinZKHaH8QnEQuZsTy1L0F8iS+jRsAmrD22LLg+SAS8sSvi2tXkGD+cI=
X-Received: by 2002:a05:600c:678c:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb860ffbb5mr16686485e9.7.1795083546559;
        Thu, 19 Nov 2026 02:19:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e051desm21458845e9.1.2026.11.19.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:19:06 -0800 (PST)
Date: Thu, 19 Nov 2026 10:19:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Bence Csokas <bence.csokas@arm.com>
Subject: Re: [PATCH v4 2/2] treewide: Use struct_offset()
Message-ID: <20261119101905.2c644510@pumpkin>
In-Reply-To: <20261118140513.GO1813469@noisy.programming.kicks-ass.net>
References: <20261118-offsetof-v4-0-95b385c10b22@arm.com>
	<20261118-offsetof-v4-2-95b385c10b22@arm.com>
	<20261118140513.GO1813469@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 15:05:13 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

(far too many recipients....)

> On Wed, Nov 18, 2026 at 12:50:09PM +0100, Bence Csokas wrote:
> > Generated with a simple Coccinelle patch found in
> > scripts/coccinelle/api/struct_offsetof.cocci  
> 
> I think this is a good example of why we don't need this. It adds yet
> another macro to remember, and doesn't actually save many characters at
> all.
> 

A more interesting exercise would be adding a typeof() into offsetof() itself.
That would let you do offsetof(variable, field) as well as offsetof(type, field).

The same is true for offsetofend().

But the churn of changing all the current uses is silly.

David
