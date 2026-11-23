Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447695;
	b=BVz0LqYW1toGkstaItoCowQtJf0LHLrREYvbujxKjCrAuB6RNyCoMJtiEdOwo3ZfHkkV
	 M3QA9DbcVXa6QqmJuoQdwWgCxqLFEZxAgkbDjgrDVnrG0M4s1t10iuMula3tIxSnq4bfG
	 r5WbH+XCe7oJeKAIxKdDKnOWuK7oYwALhvhzOQ97bBhKb7JKhDd/8EQn2VLYZw/qphAZz
	 Q2eXiAuDnCLrKaSWHxh+ZPdwyQ8vvrrQkilDxZJAxooIK7nt1kRpINJgJYOc2wmp6Frm7
	 eoUFnId7q9fRh8nkybOWBTKbFDjEhxgvvAFVQuXetPnx736VxepqlTj1++prieCPgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
	b=p7JKbbPN/+uQet08vO0OJJ3sz8DfFlBeJemaimB3LEoAZh/Vz/ImsIWPv1vBYG5HvAnS
	 0Yj7bquCuYfAxz1Oq6YTtJRoFhaKJNyCTT49s4qpkoyD2d9mzR442ZGjlGGJIZPVESFoG
	 SesjyTSnWFlJlMVEw1lgY8JVn9uvY1MkDl18Xl6clXV77j61utR5saNf8BJj/8Lv/2uNd
	 K1mcqwjQS4Rt0hfelPDzFisi5/A0T3zMlKf92RNNDPLKkzORF1bdF1Kh5HATJ6yV2bw7Y
	 TkzYEY+Ab0+9PjY0LM9wRmSY58sfG2skoGLUTlvBQ7tp0hFDfQw3MXvXecl6CBMY8BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiQ9miRn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C828C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C828C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiQ9miRn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so35799545e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447693; x=1796052493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
        b=BiQ9miRnqzc8RVv39XPCkUTH4Yvr4Ey9oMAeyzsKZ6lhoRKqIOw9VmV15BaONnttgZ
         XXkh2buh+NoWSVCtc2zM0FRi6P8d+zb8bLGdM/ANkXpF8pM8Pb+e+SYSszPCae5jHR+z
         osypd781gjnNB8DOgnAKO+ZmCSWhb3UB4UHmzXPXxr3R4CqvzcnUwnByIApjD9Nla9SM
         cORi2lyrf1k0Pi0xOllhiXAX3f/oFr9lzVZ+vNzSHQPPuEGo7yxTZXZrfiEr+KaoTNF/
         ROqp6CoytudNXjgjwwC+5OiKKJqw2Sf5h6/yiPeglMw/7E3tVUVPMDn2hbxWGFjChmYy
         8d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447693; x=1796052493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
        b=jGiF3g3RyJYDpKFqsViU/L05eFv2n0yYyRsnSHzzgM1ynGtxHf/qL28+DOjn8j2Hrs
         P1p8dBrD1wNXiL181dn+EHdcn/zYlYCqG1hf1NiPSuydVhFCWjqAQIT+BLfIu86yW4Go
         nLvy6YuLlEljriM5nrKJM7jkSyFzCGQE/hW7PaRT7uHWmjccq5Jew9B2fP3QDiitP7qJ
         HcC+oqhBEWne0nRtgq7IPgllh4Vbd5sv5qqGRNve70m7cL9e7UU9qwX4mxuntN+AFDwe
         T+vj1RQvNs0xPVMILLIkAB15PtR+JsX7GJ/dkiqAdg+EGtBn7miHpF/DlnXdTJJsYCjU
         tLKA==
X-Forwarded-Encrypted: i=1; AL+hErF4PjiiKYQpEX1pl28scV/gJtMVaCkEe6zpIiUkPMsDid5sjGeFQgrqKSLqTTEIqyKVTnA7Fh81j8ZOLLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bXrRzSn1XI8pqqFEIOKSUPblCe992FUf5+wY8bnuVeIiA6Zrb
	+5ZIlJdzDNLbdFo8KPSKa1hnqoW+rB6i/1KVENZPitMJj1iAZK2AQ1kM
X-Gm-Gg: AZFdTZelFVv/I7qSbXnRoUSILQ5KiL7NFLXxq/fVJtIiMXSec5V73ldiofTIdirFF+B
	HKp2/ikj+QYPe5VCvz32gedSxZ3sTeXGt4gCrPGoectbUInxQdLAUMRdXSoDSnibITb6RX59mKy
	URVVhBJLMpDRcZDg7y/C3yfrkqOuUmk+r/qWH6ZCMDGuephM1N/7xktMbBz903kIwnAPb6XheBV
	Mofdx/umFeF5mLD3DBr8NtEqQT+JSEAIV8DlrFgS5A9GBKSH7g+S95ST25wlXPiSgXMG4bNL51U
	/BDqtquXfIQfDRC/OXwwcK8tg2mD12p00YDQpzA2LB/SUW77adoipMu1ETjaWdcLs/FsnacK097
	/rnlzZ2iqny+PYZUe8uameuQYNR/SHDodW5C1COk6mnyZ/H3xMxyhl+Q0EO5UtTU7p7S+4nSFyR
	eCcK+PLU+F6l87D9vG+jB5zzmFmOaSz+flVPEnFZsqI4ilkhsn4QvVF/ud+t6EUpjVji4MM3z02
	zX0GO8Ld0aOF7wKGMXdn7a/ChvZDPudGXSNHi869e5VkklaUE9tyl7xuRjr40ku3bN0e/SNIcmR
	1T6YLa9HIaWgGwccjvvo8RCKJEvW1kKKZ8pb6rVBJyhBbqYTuyDKDYA50lM9wzzEwBAV4h/C9/w
	WOgB9xloy50fCRPlJkClNaBw6GTH4OqBttbCyhrUq/UL068E2luB1DF8mo/LAMCmaQI7FyrGFl+
	ZNa3pYVOF54dUT
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr262044665e9.0.1795447693025;
        Mon, 23 Nov 2026 07:28:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm21455300f8f.26.2026.11.23.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:12 -0800 (PST)
Date: Mon, 23 Nov 2026 18:28:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio_manager_module: add
 terminating newlines to sysfs output
Message-ID: <awRbiNF_FpuPwhZJ@stanley.mountain>
References: <20261123144042.60090-1-yogeshdangal66@gmail.com>
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
In-Reply-To: <20261123144042.60090-1-yogeshdangal66@gmail.com>

On Mon, Nov 23, 2026 at 08:25:42PM +0545, Chhabilal Dangal wrote:
> The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
> op_devices print their value without a trailing newline, so a read
> from userspace runs into the next line.  Other sysfs attributes end
> with a newline.
> 
> Line-oriented readers treat an unterminated final line as incomplete:
> read(1) returns failure while still filling the variable, and wc -l
> reports zero lines for the file.
> 
> These attributes have no Documentation/ABI entry and no in-tree
> readers.  Adding the newline does change the user-visible output, so
> it is an ABI change for any out-of-tree consumer that reads the raw
> value.  Please drop the patch if that is not acceptable.

Yeah, sorry I was unclear.  All the users are out-of-tree.  It's
user space after all.  So we can't merge this unless you can
ensure that the out of tree users don't break.

regards,
dan carpenter

