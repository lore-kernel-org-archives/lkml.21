Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795481693;
	b=iUZ7i/UhQDrwo5s8FXy/HWbGb4uVwm4wuKwVfhwlr5YZ2g/NF0fm9Y/aNyXpj4FjaPsQ
	 G5u1sXuQfEIAfWvruqvlrA9RfjReXRY9MrllH8xm/+cll12YNNQeUiXGjg4GgCtoidMyD
	 1xs7DgVQzdquveeibqF1ozIuP4Tl3FH2kEFYhP8xDK+JuDYb1ej/xTgjQAuPBUbjj6Cu1
	 FOyqsvFgsEN/sjWowtuYuIJKJzKhWNl5kyblOqbmQM3mXbYthAC/NwCqQDhFDIEYUH0Ug
	 5L+HWndTq26Y+TndpPF4OS74cJPIuGAhXs+7xZbnH9p81Pgv915rwtdfjw9j254/Mfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
	b=zHe2vhfBNufQJocGWhpsIdv/k/BxvJYnPIpod9hzwbbffikpJNZLBue88nwyg2ZOFhOs
	 X3QKS+nGyiaC+05oHllXnSejBTiMvfOLA1yerElJZxNvFfIY3lXYbcDYPjrfWqAT8HpSP
	 +dT8CWrjR7WdkkAqqGLDh5kgQACBKxTKNHQGftNv1eRKCkc6xeuWY7yagTe3c0bd4vZQe
	 evWDOvbdIh+bjkBkerycne/0CZ2Cr84p7khjvanv4yEyyFG2P8GLpRyyasXDyx7K3R1OZ
	 YuieoHMZ35dAedpvQuZut9qNDVx2IB+1dJdub8K30dNQd1o5txgv0pLxltwsL26Htjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5Dxd8NH;
	arc=fail smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5Dxd8NH
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c10dc41270so4270689e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795481691; cv=none;
        d=google.com; s=arc-20260327;
        b=Msybwx0iLPiLYkMzGT2LHTpzlJN9+WHyUJTxqwDScNfx8jLREOmw7q+iBHV7WgeWL0
         zdPgEz69IykmyJiLESaBZQbURraxKYXvhruR13zkhVamYY8LGcTGvc8tE+sikxsEzab6
         UuWZgMM022hiAqRcik2Nm4pNF0qi/MmXN+CxVJCKIqo7vNPdE5tz6+x63OqaRR05gB+f
         FOPoQ/oPmfvc+u/EX8Xhk/zsmdl5m9r9ZLKbXOenVWaZOnwNibzKo4iX664oNxq6rVSa
         TggA9kgTZYj+AWAfuCX2VF2h/Epd9LY1VJk9pO/8YjTvJkHBpY5D8n5DOg1PLqPE1PKa
         IoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        fh=olfpnwnzXb5sTywWnjp5hGGAWvHu1CcnQ/ybsSkqw14=;
        b=Cy+s8o1P/MwEOukMz5tlI8HBDxMrf6atm7dwMauZgVUndbSKMmAz3aJNkqmSj/TlgI
         5yhkZcXj4hwSKxRjtcEuWLxhq0L013dZA9XsLn9QWQvDB/q55XXW4ZyNKc1RW5054bw0
         0k99AWpeJSjzxOKcpyMkr41ipznGIC498ZWSKMC9OTYrIdCCu9G6+6koM7shEMuw7i6P
         sZzZHvT/PFO4+R/VlkBjpbmhGNTclJ4cQ4OfWIIPhAHh9jZVAlhAzACezzwF4GyoQ6Fo
         scXKGUTWOMdNlxfkGSlFxvETC92OwSzxrfTAa1w3dNtdNSbLEm/TFiGa/Y7wwJb9x5gM
         bNDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795481691; x=1796086491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        b=o5Dxd8NHFXX2cE4R0WwhlruqtyJ5oTB6aI2dShZR/o5Rl58IMbHEEZjajXUrFyVu6/
         8mXqmn+2VD5DRqMrlSibhb4wjce6v4IMfd8hvEFR7waf34/GvyabBuqgI4p+wbzUebY0
         PtVFDm2OmwUbfHnzZpw5hKcBjamTr9Fljw9+QPc3P/TonvAJ4LRkPwKgsZdKsQQj+mTE
         gHnJr5r7k81sZSurhg7E3ROWf7AMbZ6pikX+mz0df5BOgQbMUJnldE9O9hdgpAtnaY8t
         3eeU1jniYS96HJMurxAIjQuVWVUuh1b/3Y2+peQtrHa7ShTn5WwZEpwbSSr9cvsD8FqF
         /4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481691; x=1796086491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        b=r9YeRlg8mF9v5MCGHz6QuO+G5ULBU0hwHJb5nOiaCFCZYMHvv+1eGVEM/5gxcjWCeJ
         KsOEjBYLxKxp583BNmkLRmJ/QBWpX/a3Dv6b8OSzp/M7xSpaxeV/+CdeVqZOanp1Cr2r
         7pmMKfMyNUdB8HupnwnVHI3kacpRQQR4KNJCDYRX+NCMaK/3RpjGzekDRmKQZC4RgaoJ
         FilQM0CeqyJO9s5k2nG1+DUFGtcn0gQUw7X6jAH86Jucw5VXrVRUhVC/cs89m0bbkzZD
         q6PO1BQkWztTHfJz8aHH4sALT3lXHFSEWGIFXUzg7w/Bobw/Q1LcFt1ZUGNtoquYopwU
         ZW9w==
X-Forwarded-Encrypted: i=1; AL+hErH5m9sQZvmMgXWhp5VQf7x68MieMq2lHEF3DfqNZhU9G2SbQV82Ox11bpc8zz2AQdGEWF72BoE0dWIHyRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L+qEZ2QfLFbNth8deMRSj6V8TJMJ4DbotS6ICTntTjl4WLE0l
	lvmAKbRdPdNyFQzFxhC6OMaQjbVlswYXo8EjTbketk8/G8lbgk4fysCXIR+JHuwTAn+U643r6W5
	8LW9t/qV+EyO4fPi/RCP4mnc5XDEOz2xhmINFMDSM
X-Gm-Gg: AZFdTZeSDkmEXtc66aUx3RFLtlIM+jbleTloxoKzLI/NFBL/cTRoMyoA2i1I++anN4h
	/NlOrKK9l6Bv6WMcFc2G7iXI6D2E4C5PNzFdLID4aGrXtgT443yqDIWIUi4TAtToQCTzKK0+23z
	bQ3AisbzMJQOCCYZO63UMNOu2WUiFDLqb7kZGScIma1iceZDRwqD8cTMKl332buKvMOxZLOFJu1
	IB5RsMnlU4FCET3ltg/xcVT6OYdJ/G/JiROp0bmpBkFXDqtoO7qiqUCny3wC0OfQzbIWxV59K6z
	ZT5YWk6+awW0sdOvJHOCa7y7qxSpbgwJ/kOoUYUPBBEjJWN69+nkHD6h8BZmlMz2wOw3HmGp0GH
	gu4euAosSuCM0thK4BTU7W5iuj2+zfdcxVxd5mVQ=
X-Received: by 2002:a05:6512:618:20b0:5c0:165:16c3 with SMTP id
 2adb3069b0e04-5c1bc85f246mr2665281e87.64.1795481691103; Mon, 23 Nov 2026
 16:54:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
 <CALCETrVqc+1bjH1bhqHee9bsUdk2B6314z7PMexbsnNpMhk14g@mail.gmail.com>
 <CALCETrV=zSxb6sgA08DLiK2bQovdMEj9ycG=Cc71mLn2C5Pgeg@mail.gmail.com> <4db941ba-3001-4019-8910-63e534b29f89@schaufler-ca.com>
In-Reply-To: <4db941ba-3001-4019-8910-63e534b29f89@schaufler-ca.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 23 Nov 2026 16:54:39 -0800
X-Gm-Features: Aa3M54oMS94l-c6quSe09sYNPHMWYafhDwaB4QCI_jHSdqjrERKiY6yBrUdD7_4
Message-ID: <CALCETrX7_HidtLAjAh=D0m2Fn=1ZkfMBiXUVXbjyu+xDY19u0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Andy Lutomirski <luto@kernel.org>, "Hallgrimur H. Gunnarsson" <halg@google.com>, 
	Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Singh KP <kpsingh@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, keyrings@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:22=E2=80=AFAM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> On 11/20/2026 9:09 AM, Andy Lutomirski wrote:
> >> On Nov 19, 2026, at 2:52=E2=80=AFPM, Andy Lutomirski <luto@kernel.org>=
 wrote:
> >> =EF=BB=BFOn Thu, Nov 19, 2026 at 2:43=E2=80=AFAM Hallgrimur H. Gunnars=
son
> >> <halg@google.com> wrote:
> >>> When a process creates a new user namespace, it receives a full set o=
f
> >>> capabilities (CAP_FULL_SET) scoped to that namespace. While namespace=
d
> >>> in scope, several of these capabilities (such as CAP_NET_ADMIN and
> >>> CAP_NET_RAW) expose broad kernel attack surface that many sandboxes a=
nd
> >>> containers never need. However, there is currently no configurable wa=
y
> >>> to withhold such capabilities from user namespaces while still granti=
ng
> >>> them to workloads that require them.
> >>
> >> One thought (from the rootns thread): the other decent sized attack
> >> surface here is CAP_MOUNT_ADMIN.  Which doesn't exist as a capability
> >> bit.
> >>
> >> A sort of horrible solution (but maybe not so awful) would be to
> >> declare that the bits in cap_userns aren't actually capability bits,
> >> and that you need the bit in cap_userns *and* the bit in cap_effective
> >> to do sensitive things, and that mounting needs cap_userns to have
> >> NSCAP_MOUNT_ADMIN *and* cap_effective to have CAP_SYS_ADMIN.
> >>
> >> I want to sleep on this.  It might actually solve several problems,
> >> e.g. controlling creation of ipv4 and ipv6 loopback or tunnel devices
> >> or whatever.
> > I slept on it. Here=E2=80=99s a counterproposal.  I=E2=80=99m not sayin=
g I think this
> > is better than this patch set, but I think it=E2=80=99s worth weighting=
 the
> > options.
> >
> > Define a whole new set of privilege bits.  As a
> > poorly-painted-bikeshed option, I=E2=80=99ll call them eprivs (for expo=
sure
> > privileges - it=E2=80=99s a crappy name but at least it=E2=80=99s prono=
unceable).
>
> I played with a mechanism I called "chits" (all the good terms for securi=
ty
> bits have been consumed for a very long time) that looks a lot like
> what you're proposing. I did it to address the CAP_SYS_ADMIN problem,
> where any use of the capability opens up a whole barrel of worms.
> I cannot, unfortunately, find my patches. :( The basic approach is:
>
> A process has an optional set of chits. A process without a chit set is
> unaffected by the mechanism. A process with a chit set is allowed only
> those operations for which it has a chit. The existing but empty chit set
> allows no operations. A process may drop a chit, but not the set, which,
> again, can be empty.
>
> Because I was after CAP_SYS_ADMIN, I envisioned a call
>         cap_able_chit(capability, chit-list)
> but there's no reason there couldn't be a
>         chit_able(chit-list)
> as well.

This is quite pronounceable, but I'm not sure I could submit a
patchset with a chitlist with a straight face :)

I feel like, in our brave new world, much of the work here is defining
the interface and how it should work, and our little AI interns have
gotten quite good at actually writing the code.  So my grand plan is
to let people contemplate it until next week (i.e. after the
Thanksgiving holiday) before actually producing any code here.

I was imagining something like:

prctl(PR_EPRIVS_AND, mask1, mask2, mask3, mask4);

(i.e. define the things to be 64 * 4 bits max until we add a new
prctl, which will hopefully be along time.)  And to maybe make mask4
be specifically arch-dependent bits, because I think EPRIV_X86_LDT
would be an excellent addition.  (I say this with some chagrin because
I fixed some gnarly vulns quite a while ago in modify_ldt, and I
missed smp_mb(), and someone rooted it.)

>
> I wrote this as an LSM, but the system-wide aspect of it made that
> a questionable choice.

I'm thinking not an LSM.  The goal would be to make it available everywhere=
.

(If you missed the other thread, I'm also imagining adding
CLONE_NO_NNP, only allowed with CLONE_NEWUSER, which would *clear*
no_new_privs.  LSM would have a chance to veto this, but the default
behavior would be to allow it.  This would allow running an entire
system with no_new_privs set for all normal tasks including PID1 while
still running conventional distros in containers.)

>
> If you have any interest, I could dig more deeply to try to find the
> patches. Otherwise, I'm happy to look at what you come up with.
>
> >
> > An epriv is not permission to do something *to* an object; it=E2=80=99s
> > permission to do something that exposes a meaningful attack surface
> > within the kernel. So there=E2=80=99s no ns_has_epriv because there is =
no
> > object.  These are kind of the opposite of object capabilities.
> > Additionally, an epriv never grants the ability to do something that
> > one couldn=E2=80=99t do in an epriv-less world.
> >
> > For now, all tasks have all eprivs, even not-yet-defined ones, unless
> > user code or config explicitly changes this.  (Maybe some day secure
> > boot might remove certain eprivs.)
> >
> > There should never be a check like ns_capable || has_epriv. It=E2=80=99=
s also
> > &&, or perhaps caps are not checked at all.
> >
> > Example eprivs include:
> >
> > EPRIV_FSOPEN_VIRT: may fsconfig, fsopen, etc a virtual fs like fuse or
> > tmpfs or overlayfs.
> >
> > EPRIV_CLONE_TREE: may clone a mount tree
> >
> > EPRIV_MOVE_MOUNT: may move mounts around (but only if you also have
> > CAP_SYS_ADMIN on the correct namespace, of course)
> >
> > EPRIV_FIREWALL_TC: may configure any firewalling configuration or tc
> > configuration (this includes iptables, nftables, and ebtables)
> >
> > EPRIV_NET_RAW: may use raw/packet sockets (like CAP_NET_RAW)
> >
> > EPRIV_TUNTAP: may create and attach to tun/tap interfaces
> >
> > EPRIV_IP_LOOPBACK: may set up IPv4 and IPv6 loopback using whatever
> > new facility we add
> >
> > EPRIV_NETLINK: may use netlink at all
> >
> > EPRIV_NET_ADMIN: may use traditional CAP_NET_ADMIN abilities (all
> > CAP_NET_ADMIN checks will also check EPRIV_NET_ADMIN)
> >
> > EPRIV_OPEN_FILE_HANDLE: May use open_by_handle_at, etc.
> >
> > EPRIV_UNSHARE_USERNS: may unshare userns
> >
> > EPRIV_UNSHARE_NONUSERNS: may unshare any other namespace
> >
> > EPRIV_MOUNT_CGROUPv1, EPRIV_MOUNT_CGROUPv2: may create a new mount of
> > these subsystems
> >
> > EPRIV_PTRACE: there are lots of different variations that might make se=
nse.
> >
> > EPRIV_MOUNT_PROC_PIDONLY: may mount proc-pidonly
> >
> > EPRIV_MOUNT_PROC_NOTPIDONLY: may mount proc not-pidonly
> >
> > EPRIV_MOUNT_SYSFS: may mount sysfs
> >
> > Example eprivs that are questionable:
> >
> > EPRIV_DMESG: the kernel log is a specific object, and I think it's
> > better to control access using something kernel-log-specific.
> >
> >
> >
> > There is no operation that increases eprivs -- even without
> > no_new_privs set, a task will never gain an epriv, nor will a child
> > ever have an epriv that its creator did not have at the time the child
> > was created.
> >
> > The evolution rules could be as simple as, on fork/clone, the child
> > inheriting exactly the parent's eprivs.
> >
> > Or we could bind eprivs to a userns instead of a task, but that could
> > be more limiting and awkward than we want.
> >
> >
> > What do you all think?
> >
> >
> > FWIW, I had an LLM make an inventory (surely not exhaustive) of
> > recent-ish CVEs and how they relate to this list.  (The below is the
> > only part of this email that is LLM-generated, although I added
> > EPRIV_SYSFS because I didn't realize that nonroot userns could mount
> > it until I asked an LLM, sigh.)  To me, the list and its breakdown
> > suggests that there is quite a lot of room for meaningful attack
> > surface reductions while still leaving large parts of userns
> > available, and that my epriv proposal captures much of this but the
> > cap_userns proposal may be too coarse-grained.
> >
> > (I also asked about eBPF, and my LLM came up with a lot of CVEs, but
> > there's an existing BPF token mechanism and I therefore did not
> > propose EPRIV_LOAD_EBPF.)
> >
> > --- begin LLM output ---
> >
> > **EPRIV_FSOPEN_VIRT:** CVE-2022-0185*, CVE-2023-0386*, CVE-2023-2640*,
> > CVE-2023-32629*, CVE-2025-38499*
> >
> > **EPRIV_CLONE_TREE:** CVE-2025-38499* (only if the check also covers
> > the relevant internal mount-cloning path; explicit `open_tree()`
> > restrictions alone are insufficient)
> >
> > **EPRIV_MOVE_MOUNT:** CVE-2025-37988
> >
> > **EPRIV_FIREWALL_TC:** CVE-2022-25636, CVE-2022-1015, CVE-2022-1016,
> > CVE-2022-32250, CVE-2022-34918, CVE-2022-48911*, CVE-2022-2588,
> > CVE-2023-32233, CVE-2023-35001, CVE-2023-4004, CVE-2023-4015,
> > CVE-2023-4244, CVE-2023-5197, CVE-2023-6817, CVE-2023-3609,
> > CVE-2023-4623, CVE-2023-4921, CVE-2024-1086, CVE-2024-0607,
> > CVE-2024-27397, CVE-2024-26925, CVE-2025-38001, CVE-2026-23111
> >
> > **EPRIV_NET_RAW:** None identified.
> >
> > **EPRIV_TUNTAP:** None identified as requiring TUN/TAP. Some
> > packet-triggered exploits may optionally use it, but that does not
> > establish it as a necessary blocker.
> >
> > **EPRIV_IP_LOOPBACK:** None identified.
> >
> > **EPRIV_NETLINK:** Also those blocked by `EPRIV_FIREWALL_TC`, insofar
> > as the documented attack paths use netlink. No additional CVEs
> > identified.
> >
> > **EPRIV_NET_ADMIN:** Also those blocked by `EPRIV_FIREWALL_TC`,
> > insofar as the vulnerable operations require `CAP_NET_ADMIN`. No
> > additional CVEs identified.
> >
> > **EPRIV_OPEN_FILE_HANDLE:** CVE-2025-38306*
> >
> > **EPRIV_UNSHARE_USERNS:** Also those blocked by `EPRIV_FSOPEN_VIRT`,
> > `EPRIV_MOVE_MOUNT`, `EPRIV_FIREWALL_TC`, `EPRIV_OPEN_FILE_HANDLE`,
> > `EPRIV_MOUNT_CGROUPv1`, and `EPRIV_MOUNT_SYSFS`, plus CVE-2025-38058*.
> > More generally, blocks the documented unprivileged user-namespace
> > setup for the entire inventory when no usable user namespace already
> > exists.
> >
> > **EPRIV_UNSHARE_NONUSERNS:** Also the namespace-dependent attack paths
> > blocked by `EPRIV_FIREWALL_TC`, `EPRIV_MOVE_MOUNT`,
> > `EPRIV_MOUNT_CGROUPv1`, `EPRIV_MOUNT_SYSFS`, and many of those blocked
> > by `EPRIV_FSOPEN_VIRT`. Coverage depends on whether the necessary
> > non-user namespaces already exist.
> >
> > **EPRIV_MOUNT_CGROUPv1:** CVE-2022-0492*
> >
> > **EPRIV_MOUNT_CGROUPv2:** None identified.
> >
> > **EPRIV_PTRACE:** None identified.
> >
> > **EPRIV_LOAD_EBPF:** None identified.
> >
> > **EPRIV_MOUNT_PROC_PIDONLY:** None identified.
> >
> > **EPRIV_MOUNT_PROC_NOTPIDONLY:** None identified.
> >
> > **EPRIV_MOUNT_SYSFS:** CVE-2025-22089*
> >
> > CVEs not cleanly blocked by an operation-specific bit
> > Excluding the two EPRIV_UNSHARE_* gates:
> >
> > - CVE-2025-38058: No explicit unmount privilege. The vulnerable race
> > involves umount(2) and path lookup.
> >
> > - CVE-2022-0492: The cgroup-v1 mount bit covers the documented
> > new-mount attack path, but not necessarily configuration of
> > release_agent on an existing writable hierarchy.
> >
> > - CVE-2025-38499: The correct gate depends on which filesystem-context
> > or internal cloning operation reaches clone_private_mnt(). I would not
> > count EPRIV_CLONE_TREE as a definitive blocker without checking the
> > exact call paths.



--=20
Andy Lutomirski
AMA Capital Management, LLC
