Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433023;
	b=IMQo4Bk1tOu3gJwT/GTS2wQ7cwhimcaQUi96bthYOnd44ayu3OUy6CcnVKSWw7CRBuAA
	 3bUr91ci/toheku/1cvDhcrQrmudJHL0J7ednHsAjBxwOwjtGb0vHvK+OYDp6mqOKLEHh
	 apt6aVuNUcg6a9CBseJKAhATlI8jA0CkCMhKz7p1bZq/vMiGgeREFwcYCEYI48SKhfR7Z
	 E7W0pvbF5A9Ei0Zip3NZMV7PzFI7Bs/Ed/M+54B0Y2id4O5nCDA+jP0a4colvx0f6h9GJ
	 bHDxFDzrPICUCBijCLTLNWKd7o2JCbM+ttKq+NoPpppPN0sCsbdLWqKEuQxdJdq8feA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
	b=q6HQigCIJtQT4OwGSq17ONA7iu4B3htZv7wsKd+6aF0lvo9OsI16bc3BIotawUzfo4Uj
	 RuE2sY9iKbRhKV2spTBjwY8waSu07hZMR45vmUHS/3dBKT1vq1TEs8aQT0N7PkMpCruQS
	 0sMwZ2HZJH9IP0ckQJQi2ijphEbIwor/PfuuMTtlwsU9PzgL3XAqAiwBefiZkq4P4Z0rA
	 qzH1UAyw6GPPVCYvbrrXNIJcJZq0Xvw2lacKaaRYAZeTrcSnPiDOk2jJWkttyJnIu3i6r
	 zQiCJ5KpAJNswJnTbe4ouGiB9kncGAvbOBz3LJPWOWxt7Nw97E1MM6evtWfX4I4q4uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JltZZlhl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JltZZlhl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so25888715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433022; x=1796037822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
        b=JltZZlhl7ldUDx/+RKzkJYpJCyAgANA1yKarLA7NN4EXlJK1tn2MScxpxYreyPKp+e
         pmZHFF8mag7GyjI/4lDz9piGR2z642p+6t0VCRcVRBCj2a9FXqO+CwkYU9tImh4Mbb0U
         llaUrxiQe4xutUDndQpcJIFnwWlgdk6sumZ6RP9yXBE1Vd/9GvVhMZ6lRuGZSrtHrwqw
         JvHte+29YCHSbCaDWD7djHCusUVBslKOP3NBIM+MRVAPaXfHN+rY/I6rZLdf/FBih7SZ
         vAV6P/T/YwCXsxAEWEMdeAz9ARU6cLSD5RKoBoLDwHU31UrwSETa6bwRzeSgSskxXXtd
         ESkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433022; x=1796037822;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
        b=w/7LCwn8M2yrW43U5vWCyILVdCnZfGpjOH5//bOUJ4hQupbepEOWx4Hlw7Etu/5Src
         tOo9hcfY2GidO6ODqwBlPxFLnl78epcQCAA2vVjvbJpxovN92SlsMBotq+kW8Yfq7p1I
         QaP1bPGw6SBf2WK5J6qG9oKz9/0N0nQByyDCoNdJu26KPqQlM0omyVyJf4UMS4WUyr6V
         U8U7/NBduQ/P3dZG3gkEd3n0+z9JVatrXj+obDgJOalvScar7I1AkMs66tQvZr/g3jFU
         TIWql6JzhcZjiN6IeNZq9gSGhWUgQ7MSpfp1IU+tAxM8YUskb8T4pJHbnM13dENjitDg
         mCsg==
X-Forwarded-Encrypted: i=1; AL+hErHqBbd1rQDq+nuSTqGKzwgxMNFqu5fJKN2bFl3TAcxd2nyH48PcshmW2LgKdqp+Fn5sYlAMQEeHjj0iLLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AL38Bn1IOmeHAr2yRI+su7hbN+oI8hotxez5paXWsvXkk9Y5G
	4nfFMGgb2j5f/LfwLJSIcPMers6O0Fs26Uvs12z9ZoMp6GcgSQ0X8ltc
X-Gm-Gg: AZFdTZfSa9MvaPZgYr5TRhV/+W30lYCYO++ugzturKD+ApGQppW3qiY8e0Yq0tiscaE
	vufHH/SQHfYqWmEEPn5a9s9AK6OfpbVCKZs6rN64C2KjX2N/hPSj+0tOsirzMxNY43WuXOe0jPn
	VRLaKcvnc0AlAnit8h5JuyrdhHab3S8P7Py7J7zWwzufE4OsegcPSUf32z3d8nb2IwE0hBLsXc0
	GMok8HgQ41UhCjKCnSgu/R08d3EtM9+lLe6mQAlV7fMicDhi7z7jQhnM95EtsZEoNEn12wNbaOY
	Vy/RLkuNRXn0ed0/r80H4IXEm3R7wZQnic7QTcal0w0mM9I/3S4Bc/+Uty7d2ezB4qcYzWmsKni
	dug46iFlx1YIApx/4cg+VPp3JhMbcNQoj8H5xPK8ZUeLD7mNn6XydyQ1W05OEhkXK10DLC80Mze
	oKt/4lZs8De6k4b06EXEUVSpwK9NJ0PBrQa3f5gnhJ6eN2kZ044o3PgwMk2lMrAGFZDXuA1hgpT
	heYgb2g0P4Knwj2z0cG5y9lt0eSp/3kKEUxOIFzQV4MssS1ghjbDR1Ss2UteVLx9kR+6RIT2pQi
	53m9NbId0A6Ttoa+2ryI3rUT8mZcU/J1Xn9c2+Z5
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr240154335e9.4.1795433021711;
        Mon, 23 Nov 2026 03:23:41 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24419628f8f.24.2026.11.23.03.23.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2026 03:23:41 -0800 (PST)
Date: Mon, 23 Nov 2026 12:23:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <20261123122343.6d3f8866.michal.pecio@gmail.com>
In-Reply-To: <20261123072320.5967-1-ki.chiang65@gmail.com>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
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

On Mon, 23 Nov 2026 15:23:20 +0800, Kuangyi Chiang wrote:
> On Etron xHCs, a USB2 remote wakeup may also move other suspended
> USB2 ports into the resume state without generating individual Port
> Status Change Events.
> 
> The issue can be reproduced as follows:
> 
> 1. Connect a USB2 hub to each downstream port of the Etron xHC.
> 2. Wait for all hubs, including the root hub, to autosuspend.
> 3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
> 4. The last connected mouse does not work.
> 
> The affected USB2 ports may remain in the resume state, preventing
> newly connected devices from enumerating. Reconnecting an affected
> hub or mouse does not help. Reloading the xHCI driver restores
> normal operation.
> 
> When handling a USB2 resume event on an Etron xHC, check the other
> USB2 ports for the resume state and track them so the normal resume
> handling can complete.
> 
> Before the patch, the root hub status bitmap reported only port 2
> (evt 0004), leaving port 3 in the resume state.
> 
> [ 4621.396100] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
> [ 4621.396158] xhci_hcd 0000:01:00.0: port resume event for port 2
> [ 4621.396164] xhci_hcd 0000:01:00.0: resume HS port 2
> [ 4621.437164] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 0004
> [ 4621.569169] usb usb3-port2: resume, status 0
> 
> After the patch, the bitmap includes both ports (evt 000c), allowing
> port 3 to complete resume through the normal resume handling.
> 
> [ 4824.829350] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
> [ 4824.829425] xhci_hcd 0000:01:00.0: port resume event for port 2
> [ 4824.829431] xhci_hcd 0000:01:00.0: resume HS port 2
> [ 4824.829439] xhci_hcd 0000:01:00.0: HS port 3 in resume without event, portsc: 0xfe3
> [ 4824.870180] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 000c
> [ 4825.001183] usb usb3-port2: resume, status 0
> [ 4825.027484] usb usb3-port3: resume, status 0
> 
> Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).
> 
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Hi,

This repro doesn't seem to work for me.

Etron Technology, Inc. EJ168 USB 3.0 Host Controller [1b6f:7023] (rev 01)
/:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
    |__ Port 001: Dev 040, If 0, Class=Hub, Driver=hub/4p, 480M
    |__ Port 002: Dev 034, If 0, Class=Hub, Driver=hub/4p, 480M

# connecting a mouse to hub 2 resumes the bus:
[ 8316.191894] xhci_hcd 0000:07:00.0: Port change event, 8-2, id 2, portsc: 0xc400fe3
[ 8316.191911] xhci_hcd 0000:07:00.0: resume root hub
[ 8316.191930] xhci_hcd 0000:07:00.0: port resume event for port 2
[ 8316.191936] xhci_hcd 0000:07:00.0: resume HS port 2
[ 8316.191992] usb usb8: usb wakeup-resume
[ 8316.192001] usb usb8: usb auto-resume
[ 8316.192015] hub 8-0:1.0: hub_resume

# core polls both RH ports for status, both are resuming:
[ 8316.192030] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xfe3, return 0x507
[ 8316.192059] usb usb8-port1: status 0507 change 0000
[ 8316.192069] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xfe3, return 0x507
[ 8316.192079] usb usb8-port2: status 0507 change 0000
[ 8316.192094] hub 8-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 8316.232936] hub 8-0:1.0: state 7 ports 2 chg 0000 evt 0006

# hub 1 is resumend, inspected and suspended again
[ 8316.232961] xhci_hcd 0000:07:00.0: resume USB2 port 8-1
[ 8316.232970] xhci_hcd 0000:07:00.0: Set port 8-1 link state, portsc: 0xfe3, write 0x10e01
[ 8316.233017] xhci_hcd 0000:07:00.0: Port change event, 8-1, id 1, portsc: 0x400e03
[ 8316.233041] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xfe3, return 0x40503
[ 8316.233061] xhci_hcd 0000:07:00.0: clear port1 suspend/resume change, portsc: 0xe03
[ 8316.244881] usb 8-1: usb wakeup-resume
[ 8316.244921] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xe03, return 0x503
[ 8316.256001] usb 8-1: Waited 0ms for CONNECT
[ 8316.256014] usb 8-1: finish resume
[ 8316.256917] hub 8-1:1.0: hub_resume
[ 8316.259088] usb usb8-port1: resume, status 0
[ 8316.259122] xhci_hcd 0000:07:00.0: resume USB2 port 8-2
[ 8316.259131] xhci_hcd 0000:07:00.0: Set port 8-2 link state, portsc: 0xfe3, write 0x10e01
[ 8316.259158] hub 8-1:1.0: state 7 ports 4 chg 0000 evt 0000
[ 8316.259345] xhci_hcd 0000:07:00.0: Port change event, 8-2, id 2, portsc: 0x400e03
[ 8316.259410] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xfe3, return 0x40503
[ 8316.259552] xhci_hcd 0000:07:00.0: clear port2 suspend/resume change, portsc: 0xe03
[ 8316.261302] hub 8-1:1.0: hub_suspend
[ 8316.262137] xhci_hcd 0000:07:00.0: Set port 8-1 link state, portsc: 0xe03, write 0x10e61

# hub 2 is resumend, inspected and the device enabled
[ 8316.270925] usb 8-2: usb wakeup-resume
[ 8316.270950] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xe03, return 0x503
[ 8316.272785] usb 8-1: usb auto-suspend, wakeup 1
[ 8316.282855] usb 8-2: Waited 0ms for CONNECT
[ 8316.282867] usb 8-2: finish resume
[ 8316.283835] hub 8-2:1.0: hub_resume
[ 8316.284504] usb 8-2-port1: status 0301 change 0001
[ 8316.391951] usb usb8-port2: resume, status 0
[ 8316.391985] hub 8-2:1.0: state 7 ports 4 chg 0002 evt 0000
[ 8316.392650] usb 8-2-port1: status 0301, change 0000, 1.5 Mb/s
[ 8316.393099] usb 8-2-port1: indicator auto status 0
[ 8316.447829] xhci_hcd 0000:07:00.0: xhci_hub_status_data: stopping usb8 port polling
[ 8316.457913] usb 8-2.1: new low-speed USB device number 46 using xhci_hcd

# (not shown): hub 1 works normally, including wake on connection

Regards,
Michal
