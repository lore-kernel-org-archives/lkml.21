Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794969186;
	b=z2LQYcNTkyYBOr2PJG/FVo6qr9EMvxhW3mfuuMNQi+JkQx2Qo/f5m1GsahSIvcZIUb3g
	 g35kFOoeeMKCOq1ZWYMde6pDrxaBDhCylMTR0szfUA0WznRV8vLeWpvh9ySVQ1DQrAdmF
	 SD/4Kjd8SuCtukY9Gj6cfWcqA2NlpgWtI/ZdGrAAxXpBclPXggMVdE8bgwL0J13mOI8SG
	 kB1ikdl6vnX3fvpII+wh6+EBzLC1GcYOzzrOjXdGWd3qWCfHEN1TotqK/8MDlFwBzDAWT
	 3aeb3RAuVaZetJNBOSEKSeMBrm6Gsh/pVELb/l1mSlw3iA907TForAKLfjO1OerO7zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
	b=bD6qWgoezL67qywlOccmywxXSJ0QSLf58qr5m5tZ3osRrYfsqzS9/EYFd2zjKw74KoTI
	 82c2sABgKESGsf9c9+lC1Ne+EW4ZHIn/x7kg3y3DiB0Z+APrWGw/Y5QJU4QNNLm0Y8WmD
	 A1uAHTdvOwV/IxZxBTvCjNvy9GpwqUTGS76r4Z0JM34bOtoB43njIDXT7ve6nf5xhRcpJ
	 C2hnJbNrdvTEwqZiW05xNnAAR9AIkp3B59u3Aj9dWgYfuScDvnWry3zMOqFYnUAzgjXC0
	 KhrYMtzKO0plm6O5N184zrEklOCzcjXIndkpDZw/EPeWrG0WGNJZzDcMre6k9fwzc4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F;
	arc=fail smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E122B606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E122B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ec690faf85so157179e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969185; cv=none;
        d=google.com; s=arc-20260327;
        b=b5ofqEz3xV5pk59RSwPV8a08qApfwwOTECcAElGNS12bM/WcW3n1EsuKhXEYVMsoWh
         hKPm1IIDY5jK8bBGd/CtOOvGCyfbY1TXUfHeviQpr+YYAzNUr6ka/o+JMnJVFidNDNug
         6bEP0w8yHidXy2EOm514RBAin/pvwPdBOclNZC5SShmB09X19RhrdPNdpQ3Po1Y6XANz
         zmHUyzV1fkKUNkyeeEWMGbIllDLewsP4LIFWKpy9/P9ZetYWarnAgS8qhsEMFfi3fyZ2
         1v+Ly7Nl9me8iRCSBg6WVX1q6PEglB2NP/VDHbEypVNPuPo7LkStzUlMPKHEl9gj40Q+
         Y32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        fh=4gTmFP2Us3W7EUnCph8mdHzw+HGNNjzswSFhnZ0VMXA=;
        b=FKuzjXP4FER8Q4EZogz+xnB9b10kpGDD+YJpbpyIWSHzGiC0VUGAwmV+CPMbWqnpHc
         PKuA/gkRK6x0+iliDzFXLef0/fzl0RTRMxa93icLzL2wx7fABj1ENPjECgT+A29vfcM7
         lkFJAmaIr47PxHe1u1+gGdiTS++rVxPWHdhrMYUMdpdrhd0uSpaPSHhATE09zO1l6pgQ
         HHwD44Gs4F4lquaVLJmEDZ908cMQ+zJa9K8TqhdW+A++UJTjYR8maI/0WdwbxrAh94+L
         72hyGSURktollJXwDn6oTN5TZ0Oxydr+r3GR+jcFNLQPR46MA0bp5h7MUbCfbAv9m3X/
         ouyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794969185; x=1795573985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=brQVox1F6VXFbGdLs1+5DMYomOu4P/zJmzDC9Ti5885w/zs4TQQIbpk+NF3r9zyy1Y
         qzRElcNXYoo8DvxnoVvb4Lbf2dAREqfcmjd+iBdL2wbVRCy4kMnQzyJFpR8fHmKM9fG+
         uQ6XWKes8zbeiQgz5eIIM+Te8KNZBYgvc4IlvpXFqiLwJwab8cpVZCulDFC1NjLhrbRp
         6wPQfnwT8XLwP0RKpR98M7DveMFpl7k7gkT0M5oawiW5vG12E08SQ+FH3gyn2OzHJ6Df
         GlPjHxzCjAc+xAHLmrN6KMr/POrH1l/qjoCfhQjmNAz7Z3gFO1JokkIfILvegihdbN1f
         arWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969185; x=1795573985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=bfkKCUz6z5PRWuNv2oc6njm5SjAFCro04wt+hNqGtgRkLftY4+QP+QcRsE4yhI9OBY
         Q/pOe9qOXYHC0GY/tNuFNldK55dgO3fBxp0MVjY/ubnxkloShAIKW3Klz4m9w0U6iVNU
         oDL+ZSQQPk00sLJsb949A7BUxlGANgY36eHOzMFYwmYwKSJp1hvtWkJmXwImGf0TeRgT
         Z6gP+vyrhcPwXkRWfu80ViaVwmnjJNMT+e3nTqekNNH2yfxMnI37ZMoQUqf6+WN7drMG
         CbjKiuV+P/pV+vwkhq24qf4aQ0aiabnEuoksn6M0xsMw3HofQYMD9FpHL+XjnVrENyd/
         wyTg==
X-Forwarded-Encrypted: i=1; AL+hErGj5RJE5tjs2Z4b3unNyQw283cg7mUt3Fkfkd+b/rJIkDQkWSwDKLW6omqG+lEhOC43/PqdLo/GeAclj0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zL5upVKU0XIVUAhCW4wTKaqlXrCbLL9ozIASFBzDYr/9W8HWa
	O2ait2qMU0YZvc1zwXhTma8up6LtxexyXLcLIhRxpap70MlCea6GXGs4wBA/f3RpVRlSyY8R9gT
	9C4bmFaQsNvS24d9TP+hgZ7cUak1gUZDqksn93Yfv
X-Gm-Gg: AYBFou0++BdjK22+zNQsGMdcOaEpK8ctmxh7mVD7l8IBmtGeUU2NmIQbu2+MK9vAM1V
	46OCPSzL7b0TMtFvUNPAlsxLYjWMFz3taHJ9MOngh+muynE95l1u5B9fh9eyYDd4WFtmOtXCdcA
	3FL+msOn5tivvjJ3ypxaOMZa+VHPmjhQSUf8Cg76PU/dOZvS4jXZrYXuhxjDbc7FPuLW20D24AR
	cF3pNs0u3iUaKjwUzAPV22yDu++ALn2lGVTSy2gMijDsBtsc6gl88s7umaXsWbqotpSgRsT7RpF
	gQ317//qRXiOBNBNoav3Br+IUzmVxx2vY1ATjQJZEjh69vbRCxsT5zCnwpSH+mHdotD94CXdtjw
	6elUJmR7hAEy9A5ePFtS2Psw3VoMnx7bgrpq0
X-Received: by 2002:a05:6122:2090:b0:5ec:e6b8:eb94 with SMTP id
 71dfb90a1353d-5ee64707670mr743046e0c.12.1794969184030; Tue, 17 Nov 2026
 18:33:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora> <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
 <avwBrbJfp4ET9ifT@fedora>
In-Reply-To: <avwBrbJfp4ET9ifT@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 17 Nov 2026 18:32:52 -0800
X-Gm-Features: AclHuK8PlSleIouGSsimoM04t8dnEBmceA6kyDcl75PCQlr4VIa_x83DUMY1klA
Message-ID: <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Mon, Nov 16, 2026 at 11:26=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> Hi Pin-yen,
> On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> > Hi Hangbin,
> >
> > On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux=
.dev> wrote:
> > >
> > > On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > > > Hi Pin-yen,
> > > > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > > > The prio test intermittently fails in the arp_ip_target and
> > > > > ns_ip6_target variants:
> > > > >
> > > > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [=
FAIL]
> > > > >     Current active slave is eth0 but not eth2
> > > > >
> > > > > The ARP/NS monitor marks a slave down when it has received nothin=
g for
> > > > > too long. With arp_interval 100 and the default arp_missed_max, t=
hat is
> > > > > about 250ms for the active slave (eth1) and 350ms for a backup sl=
ave
> > > > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the =
reply,
> > > > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Onc=
e eth1
> > > > > is down, its probes reach no one and no slave receives anything, =
so
> > > > > eth1 normally times out first and the new active slave is picked =
by
> > > > > prio:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D10   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 300ms -> down
> > > > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > > > >
> > > > > But the test takes eth1 down right after bond_check_connection(),=
 whose
> > > > > ping replies only arrive on eth1:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D70   ping reply on eth1 only
> > > > >   t=3D85   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > > > >   t=3D400  monitor: eth1 idle 330ms -> down
> > > > >                   eth2 idle 400ms -> down too
> > > > >
> > > > > eth2 can then no longer be picked. eth0 becomes the active slave =
if it
> > > > > happened to receive some other packet (e.g. an MLD report), other=
wise
> > > > > whichever slave comes back first does. With primary_reselect 1 or=
 2,
> > > > > the bond keeps eth0 even after eth2 comes back.
> > > > >
> > > > > Before taking the active slave down, wait two monitor intervals
> > > > > (200ms), so that at least one more probe is sent after the last p=
ing
> > > > > reply and all slaves last received that probe. The miimon variant=
s do
> > > > > not need the wait, but the extra delay is negligible.
> > > >
> > > > I'm afraid the waiting time is too strict, especially with a debug =
kernel
> > > > since delays can happen.
> > > >
> > > > Bjoern is also fixing[1] this issue by pinging a non-existent neigh=
bor to
> > > > keep traffic flowing. Would you like to test whether that works for=
 you?
> > > >
> > > > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@a=
mazon.de/
> > >
> > > BTW, using ping may not able to triger the arp request in time. You c=
an try
> > > arping instead.
> >
> > Thanks for the pointer, but I believe Bjoern's patch addresses a
> > different problem.
>
> I think they are the same issue, as you comment also said
>
> The ARP/NS monitor marks a slave down when it has received nothing for
> too long.

This is the existing behavior of the bonding driver, and the prio test
uses it to check which backup slave takes over. Slaves being marked
down is not the root cause of the test failure. Instead, the root
cause is the ping replies described below.

>
> >
> > Bjoern's patch keeps the traffic flowing so that idle slaves are kept
> > alive between the test steps. This patch fixes the case where the ping
> > replies from bond_check_connection() only arrive on the active slave
> > right before it is set down. The active slave's failure is then
> > detected one monitor interval late, when the backups have also timed
> > out.
>
> The reason is we set arp interval to 100ms, and slowwait also check every
> 100ms. If the backup slave down at the same check point, e.g.
>
>   t=3D300  monitor: eth1 idle 230ms -> still up
>   t=3D400  monitor: eth1 idle 330ms -> down
>                   eth2 idle 400ms -> down too
>
> The test failed.

I don't think the slowwait interval makes a difference here.

The ARP monitor decides which slave becomes active, and slowwait only
reads the result afterwards. The test expects the active slave and the
backups to time out in different monitor runs, so that a backup can
take over. In the example above, eth2 is already down when the bond
picks the new active slave, no matter when slowwait polls.
>
> >
> > The ARP requests triggered by Bjoern's ping are sent only about once
> > per second, which isn't frequent enough for this failure. I tested
> > Bjoern's patch and confirmed that it didn't fix the issue in our
> > testing environment. We also can't simply use arping instead because
> > iputils arping doesn't support sub-second intervals.
> >
> > If you're worried that the 200ms sleep is too short, would increasing
> > it to 0.5s or 1s work for you?
>
> It's not about the sleep time before setting active slave down. I'm afrai=
d
> about the slowwait checking time. Even we sleep 1s, with arp interval 100=
,
> we still only have 100ms checking window. Before the window, the active s=
lave
> is up, after the window, the backup slave also down. With a debug kernel,=
 this
> time is a little tight.
>
> So, either we have some background arp traffic, or let's extend the arp
> interval to a larger one.
>
> What do you think?

I agree that a 100ms ARP interval could be too short in environments
like a debug kernel.

Background ARP traffic doesn't widen that window, though: it is sent
through the active slave, so once the active slave is set down,
nothing reaches the backups. It could only help with the ping reply
race if it were very frequent; Bjoern's patch triggers about one ARP
request per second and didn't fix the failures in our testing.

Increasing the ARP interval alone won't address the ping reply race,
but it should help in environments like a debug kernel. I'd prefer to
keep this patch focused on the ping reply race and send the ARP
interval change as a follow-up, but I can fold it into v2 if you
prefer.
>
> Thanks
> Hangbin

Regards,
Pin-yen
