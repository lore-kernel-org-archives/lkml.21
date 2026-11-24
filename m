Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532026;
	b=oN+2GzrYfA7eDp8r+WJi0h3MI/48gyPTehDxJsoHPZLz4D22K43jUuek9usBcg8WkZfV
	 sw0javIydqU7vdZThVFwRZz/jIp/J9z1plKzGpcg/NhrwpU6slN2LSjOTC2AELu61bxZc
	 F+NIBxE+MFqwO95ugp2kcuOOXsHcV68NqNsEvZrH+i2xQM/DexWfHt8jP4RJPdiqHdqEB
	 vCzqz46YgZPPAd1696aDvIogNc/BNnJpit9pxF6/ciBjJsZP5FBUyumXeXgpfVbd9jBwW
	 gpm3Tc+d19JP0TIe57wLRsdzBkjqBW1K+2LlcV+EgkF0fk8qi76OMl/BvjWmnRcKEpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
	b=Y+g2rZ7U0bH82pcrHO/vPz5DLVuMbGj5/TePXtgkm6MwgHk4D9Hy5Ymcmlj++Rftk5Qg
	 vtUyuJ7EQVbsoi49RYKRMBkIw+5LCN1QX0jcHvlXJQ3d6i7acxfp3NP4D7iu4K8UeH9s3
	 5qMffyDZVP7ERPit+ot6ajO4RC5Y8p1HtKiI203a+eJZToFbH9uxTBQREiSpFIsbygDXq
	 CX8U0WTJd2L++fCQP90b1096DUXS9U49gMHfh9W4/5Iy9K3ntna4jwQXHwxUp1A3vTD5f
	 g9paDligH27dI6kF/tr/aEHAsmlH0mJWFQcsCEIkVCybLi7BbKo0VFT2DF9aUcSk/PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCwzg31b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9518606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9518606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCwzg31b
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so3909531137.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532023; cv=none;
        d=google.com; s=arc-20260327;
        b=Njp70aTO9iK6MG3RxKhYNgL1BuvICbszeX7Gb5ex2DqZkpbO3RB0kkQniquprhceeb
         iWyn5esNAlqwwYm5pHuYfcx95H6acXIFyi41iw77s55JFNkF+dLldZDZ1Uh6Qwb8TL9G
         zCjvJYCuV97uLJlXktJAi0S03D8l9jXHi/IpWTL7Olvi57+92Bjtu5QflRkVHbOOdMYO
         FrhoI3nOD3BJgVxHbRfhWu7wo2YezjuxFutW6R1PVU6f0N79k5ASwgHv+vZDUY1sIeOn
         tYUSPZuAv4N8XB1+shcsuEI9oKUaRidxoM2bsju8rQhQ42PLGdr7GiteW/f49Wz37Uro
         XGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        fh=OYVSa7nUfNwnyDY5W7TpxqrmYuR6sq3QLMSiZlN9D8w=;
        b=K8IpHG6VtUE+0V/DT/VrN1/ws453BAyLb1+AuqTkG7wnWQvgec2p31dgl+05t/9bCe
         Ghg2NlV5w+drJyfvqookLw6DWjpEhoerfCV/2ZZ3kZcPQ89rd3KaJJ6Yfzor8UzbgzDO
         2DKdWJcJyI3GHwrnkrzS3+lqZDXbCKj6MYTKGRJ6HB2sQR8rzKtmoSb+0ft3/+87tTTy
         pCH7YXZxKrWYHH/nhyV+ZFjTOyk16crUZCK9pv0m95dihzXOipo+OF5+rUxyeahzydPT
         J3Iq0evptH6YcaXHm+KboZNcyEUAgciixH+GNGKRDUKjvZQz/3LJJcuTkp25jucRy7rb
         l8QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532023; x=1796136823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        b=kCwzg31b61xUyZ1Njmby56I4y75QoAPpwh26ScOgN4ObCP0v3GTn/gcSpD6Ai3+HTT
         cPjO8rJTx3sKEr3drMT5RdCV/3SucTbD90GkS+RQ9zIQqGnhM6Nk6TnU7bsdepsmYKWm
         O88NbMPfBePRhUQQbmmky7hr2J6qSvk2NDdfXlcf1ViRjvuxcU3A3a+nffyHdNTyzP04
         I/rcTyISn/ZcLnRsweDHSZflYNaIFGB2RgLBJ8l41EB1hEzeFGCvdGHuD9QanpWGwvbE
         E/vS2mkkfsPFSuHrUPO66LnWor+wVe4coX9xwu82qObIiQQEsgLPciMG3NCoVapZfKbF
         salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532023; x=1796136823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4wXMx28wnrcUl8Oo79c8VzU0Hk3YuGD1icb2+Qx9Ck=;
        b=D2N7oe1Bgiar25OraiGTux+CfDOBaag7QIzgpih6T9tdoRR20KE7DjkY3fxvhhXq5E
         h9HHIWhIXRYtL2+ZbPuTnh3mz/c0vmn7Sqjt3+jCGKfW9r44SsD99GVO5Dnw+M403cPx
         KYB9ftl+M398YjoeSSzwYkNvo2rSm9R7mI/tpNrQ7BXLF5PIBKrkVbmMqlJt6qNOm5yR
         DXy0g9+UjyA4VvZdKfpiIGAioDkghKCoQZtuhB8Nqy/MamyXPTbOFoiIkdgtrsPKKEZH
         4jXbP0FoSHBN9Q87qroQE9AN2SzSDQcXsx2kmd8NKEROeb8/dQt7X94eazRC4bkaKNQG
         4pxA==
X-Forwarded-Encrypted: i=1; AL+hErGREV9mzWkHFZ2oQuM4phvlif4IC3S8Sin2qSHiLvsJ8MVtJos2v6NAVyNUfa4E8E2wxFKdy9Go2rW+k+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LSSptZz7/Szz1dwSfo7EEgh+WWUAxlZ8nPC65st/hGx+ImknO
	KplWMFTuDxFratXUBHHxmGfRcP1Yz3YAQ/i+I+rMEjtOHbiIgm7U5x3aS5sirKXySt4LVyWsNGc
	NkQrdHzzdkC94x5pVkArddLjtynj5DHpyZPF7yq8=
X-Gm-Gg: AZFdTZePA1dWfyUIMQMbGhDnVP10t/seEy3YvqUaCK+lquUq+NI83HnUqzGXsgmweYa
	HSBJJfxtcRf2MS5oHkSGMaqYb7kHCd2J4Z5hK6t7ICSc6EUfwe4Ge+MwUPYb+q7wlaaaMffCwPo
	foznHTcayLkKHX2lGHfwlMvRjMouqwCsglwMGtPYF9y/VJ97qKfg22QB390E3Ir2+YX3HOHrfAG
	DR5Qe7AFT0lSKR7vv3kkZuu05kE0iMQqUbA/GtN43gfUZZFLxJIeaVnf/AnqlIZvUJjhA4hfJrL
	lIqi0nDb4SVT+XMA/tddDjjnLTnCeKgXep0Pt56ScvrmJDPLQ2Q/9XKu01Zc/dEb86rQhCcDHW4
	2MFDzOUi9UDqQ2jrUppmcxdFLFe4mdRg1wP5DXUsHiyf8TpCGDiEjpG+x98hwASjU+SbcYNn8AF
	MFEHhTZMU37leEzDvkKZ9/U4pp48K2VO2Oym0oqw==
X-Received: by 2002:a05:6102:3f8f:b0:7d2:cc91:1aaf with SMTP id
 ada2fe7eead31-7d6dba78adfmr6131696137.43.1795532023428; Tue, 24 Nov 2026
 06:53:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035521.2098757-1-pkfxxxing@gmail.com> <179549363640.3135.12116855475874204489@kernel.org>
In-Reply-To: <179549363640.3135.12116855475874204489@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:53:30 -0500
X-Gm-Features: Aa3M54oPzesmcTAa1PYzdqgYL028mdClhKf8Jmt-5seWny9gepW1GQ9oSpeVJM8
Message-ID: <CADvbK_c8yk1taX2whZHTn=F-yhkvZjBLXtmJ-JqVrFU7o9kkFA@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: fix use-after-free after association migration
To: netdev-bot+sashiko@kernel.org
Cc: pkfxxxing@gmail.com, marcelo.leitner@gmail.com, kuba@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:13=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch makes deferred PMTU handling lose valid MTU
>   reductions.
> - [Medium] sctp: unlocked state mutation on migrated sock in
>   sctp_icmp_frag_needed()
>
> Pre-existing issues:
> - [Medium] The deferral branch of sctp_icmp_frag_needed() does a non-
>   atomic read-modify-write of the 1-bit field t->pmtu_pending=E2=80=A6
>
> --
>
> sctp: fix use-after-free after association migration
>
> Timer and ICMP handlers that cache asoc->base.sk now check, after taking
> the BH lock, that the association still belongs to that socket. If it
> has migrated, they defer the work as they would for a busy socket. The
> patch also moves the PMTU size check from sctp_icmp_frag_needed() into
> sctp_transport_update_pmtu(), and adds READ_ONCE()/WRITE_ONCE() pairing
> for the socket pointer.
>
> > diff --git a/net/sctp/input.c b/net/sctp/input.c
> > index 9494cfa51106c..555695718abf9 100644
> > --- a/net/sctp/input.c
> > +++ b/net/sctp/input.c
>
> [ ... ]
>
> > @@ -372,12 +372,7 @@ static int sctp_add_backlog(struct sock *sk, struc=
t sk_buff *skb)
> >  void sctp_icmp_frag_needed(struct sock *sk, struct sctp_association *a=
soc,
> >                          struct sctp_transport *t, __u32 pmtu)
> >  {
> > -     if (!t ||
> > -         (t->pathmtu <=3D pmtu &&
> > -          t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu))
> > -             return;
> > -
> > -     if (sock_owned_by_user(sk)) {
> > +     if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> >               atomic_set(&t->mtu_info, pmtu);
>
> [Severity: Medium]
> The association can migrate between the READ_ONCE() of asoc->base.sk
> and bh_lock_sock(sk). When that happens, sctp_err_lookup() still
> returns the old socket with only the old socket's slock held. It
> counts the ICMP in LINUX_MIB_LOCKDROPPEDICMPS, but it still hands asoc
> and transport back to the callers.
>
> sctp_rcv() handles the same window differently. It drops the old
> lock, rereads rcvr->sk and takes the new socket's lock. Is there a
> reason sctp_err_lookup() can't do the same?
>
> As written, the migrated case falls into the deferral branches of
> sctp_icmp_frag_needed() and sctp_icmp_proto_unreachable(). Those
> branches still modify shared association and transport state.
>
> sctp_icmp_frag_needed() writes t->mtu_info, asoc->pmtu_pending and
> t->pmtu_pending. t->pmtu_pending is a bitfield that shares a word with
> t->dead, rto_pending, hb_sent and the other transport flags. BH and
> process context on the new socket update those flags under the new
> socket's lock, not the one held here.
>
> sctp_icmp_proto_unreachable() checks timer_pending() on
> t->proto_unreach_timer, then takes a transport reference and calls
> mod_timer(). If sctp_transport_free() runs on the new socket at the
> same time, its timer_delete() of proto_unreach_timer can land before
> this mod_timer(). The timer is then re-armed after teardown and keeps
> the transport alive until it fires. sctp_generate_proto_unreach_event()
> should then see asoc->base.dead set and bail out.
>
> None of this is serialized against the new socket's owner. The only
> lock held belongs to a socket that no longer owns the association.
>
> The busy-socket case has a similar shape and predates this patch.
> Before the patch, the migrated case ran full ICMP processing under the
> wrong lock, so this is an improvement. It still isn't fully closed.
>
> Would it be simpler to switch to the new socket's lock in
> sctp_err_lookup()? Alternatively, the ICMP could be dropped entirely
> once the association has moved, instead of recording deferred PMTU and
> proto-unreach state.
>
This is a pre-existing issue.

> [Severity: Medium]
> Can a pending PMTU reduction get lost here?
>
> The size filter used to run before this deferral branch. Now that it has
> moved, the branch stores every Frag-Needed/PTB value in t->mtu_info,
> including values at or above t->pathmtu. t->mtu_info holds only one
> value, so a later report that cannot lower the MTU overwrites an earlier
> pending reduction.
>
> For example, with pathmtu=3D1500 and the socket owned by the user:
>
> ICMP#1: mtu_info =3D 1200, pmtu_pending =3D 1
> ICMP#2 (stale, or from another ECMP path, matching vtag): mtu_info =3D 15=
00
>
> On the next transmit, sctp_packet_config() or sctp_sendmsg_to_asoc()
> calls sctp_assoc_sync_pmtu():
>
> net/sctp/associola.c:sctp_assoc_sync_pmtu() {
>     ...
>                 if (t->pmtu_pending && t->dst) {
>                         sctp_transport_update_pmtu(t,
>                                                    atomic_read(&t->mtu_in=
fo));
>                         t->pmtu_pending =3D 0;
>                 }
>     ...
> }
>
> sctp_transport_update_pmtu() is called with 1500. The relocated check
> returns false:
>
>         if (t->pathmtu <=3D pmtu &&
>             t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu)
>                 return false;
>
> t->pmtu_pending is then cleared anyway, so the 1200 reduction is never
> applied or retried.
>
> Wouldn't the association then keep sending packets larger than the real
> path MTU until another ICMP is processed? The new migrated-socket
> condition also sends more ICMPs into this unfiltered branch.
>
> >               asoc->pmtu_pending =3D 1;
> >               t->pmtu_pending =3D 1;
>
The scenario requires two ICMPs for the same transport to hit the deferral
path in quick succession, with the second carrying a stale, higher MTU.
This is already a narrow race.

Even if it occurs, PMTU discovery self-corrects on the next oversized
packet, when a non-deferred update can take effect.

The original sock_owned_by_user path already had the same single-slot
overwrite limitation. The patch only extends it to migration; it does not
introduce a new bug.

Thanks.

> [Severity: Medium]
> This is a pre-existing issue, and the patch did not introduce it.
> t->pmtu_pending is a 1-bit field that shares one __u32 word with other
> transport flags in struct sctp_transport:
>
>         __u32   dead:1,
>                 rto_pending:1,
>                 hb_sent:1,
>                 pmtu_pending:1,
>                 dst_pending_confirm:1,
>                 sack_generation:1;
>
> Here only the cached socket's slock is held. In the busy-socket case,
> the process context that owns the socket can update those bits at the
> same time.
>
> In the migrated case, code running under the new socket's lock can do
> the same. Two examples are sctp_transport_free() setting
> transport->dead =3D 1 and sctp_assoc_sync_pmtu() clearing pmtu_pending.
>
> Could this read-modify-write of the bitfield word lose a concurrent
> update to one of the other bits, such as transport->dead?
>
> The busy-socket form of this race goes back to the original SCTP code.
> This patch adds the migrated case as a second way into the same branch.
> Before the patch, that case did full PMTU and retransmit processing
> under the wrong lock, so the patch reduces this exposure rather than
> creating it.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261120035521.2098757-1-pkfxxxing%40gmail.com
